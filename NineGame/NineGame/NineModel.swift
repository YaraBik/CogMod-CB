import Foundation


struct NineModel {
    var mnsPairs: Array<Array<Int>> = [[1,1], [2,2], [3,3], [4,4], [1,3], [3,1], [1,5], [5,1], [2,6], [6,2], [4,5], [5,4]]
    var model = Model()
    var modelFinal: Bool = false
    var playerMNS: Int = 0
    var modelMNS: Int = 0
    var gamesWonPlayer = 0
    var suggestedPlayerMNS: Double = -1.0
    var suggestedModelMNS: Double = -1.0
    var roundPlayerInfo: [String: Array<String>] = ["strategy": [],
                                                    "bids" : [],
                                                    "type" : []]
    var roundModelInfo: [String: Array<String>] = ["strategy": [],
                                                    "bids" : [],
                                                    "type" : []]
    var roundChunkHistModel: Array<Chunk> = []
    var roundPlayerBids: Array<Int> = [0]
    var roundModelBids: Array<Int> = [0]
    var overallChunksModel: Array<Array<Chunk>> = []
    var highlightedBid: Int?
    var playerScore: Int = 0
    var modelScore: Int = 0
    var bidString: String = ""
    
    
    init() {
        model.loadModel(fileName: "nine")
        model.run()
    }
    
    mutating func reset(){
        roundModelInfo = ["strategy": [],
                          "bids" : [],
                          "type" : []]
        roundPlayerInfo = ["strategy": [],
                           "bids" : [],
                           "type" : []]
        model.reset()
        suggestedPlayerMNS = -1.0
        suggestedModelMNS = -1.0
        roundChunkHistModel = []
        roundPlayerBids = [0]
        roundModelBids = [0]
        overallChunksModel = []
        highlightedBid = nil
        playerScore = 0
        modelScore = 0
        bidString = ""
        gamesWonPlayer = 0
        overallChunksModel = []
        roundChunkHistModel = []
    }
    
    mutating func resetModelTrial(){
        roundModelInfo = ["strategy": [],
                          "bids" : [],
                          "type" : []]
        roundPlayerInfo = ["strategy": [],
                           "bids" : [],
                           "type" : []]
        self.bidString = ""
        roundPlayerBids = [0]
        roundModelBids = [0]
        modelFinal = false
        self.setMNS()
        
        
        let chunk = model.generateNewChunk()
        chunk.setSlot(slot: "isa", value: "game-state")
        chunk.setSlot(slot: "my-mns", value: Double(modelMNS))
        
        model.buffers["action"] = chunk
        model.run()
        
        let modelAction = model.lastAction(slot: "my-move")
        
        //print(model.dm.chunks)
        
        if (modelAction != nil) {
            self.roundModelInfo["type"]!.append("claim")
            self.roundModelInfo["strategy"]!.append(model.lastAction(slot: "strategy")!)
            self.roundModelInfo["bids"]!.append(modelAction!.description)
            self.suggestedModelMNS = Double(self.modelMNS) + (Double(modelAction!.description) ?? 0)
        }
        else {
            print("No action returned.")
        }
    
    }

    mutating func chooseMNS(_ mns: Int) {
        print("You selected an MNS of: \(mns)")
        self.roundPlayerInfo["type"]!.append("claim")
        self.roundPlayerInfo["bids"]!.append(String(mns - playerMNS))
        self.suggestedPlayerMNS = Double(mns)
    }
    
    mutating func chooseBid(_ bid: Int, final f: Bool) -> Int{
        //:')
        let numbers: Set<Character> = ["1","2","3","4","5","6","7","8","9","0"]
        let chunk = model.generateNewChunk()
        let isa = "game-state"
        let state = "game"
        let opFinal = f ? "yes" : "no"
        let opMove: Value?
        let myBidDiff = (roundModelBids.count == 1) ? Value.Empty : Value.Number(Double(abs(self.roundModelBids.last! - modelMNS)))
        
        if (roundModelBids.count == 1)
        {
            self.roundModelInfo["type"]!.append("opening")
            self.roundPlayerInfo["type"]!.append("opening")
            opMove = Value.Number(Double(bid - roundPlayerBids.last!))
        }
        else{
            let lastTwoBids = Array(self.roundPlayerBids.suffix(2))
            opMove = Value.Number(Double(lastTwoBids[1] - lastTwoBids[0]))
        }
        
        chunk.setSlot(slot: "isa", value: isa)
        chunk.setSlot(slot: "state", value: state)
        chunk.setSlot(slot: "my-bid-diff", value: myBidDiff)
        chunk.setSlot(slot: "op-move", value: opMove!)
        chunk.setSlot(slot: "op-final", value: opFinal)
        
        model.buffers["action"] = chunk
        model.run()
        
        let modelAction = model.lastAction(slot: "my-move")
        var bidName = model.buffers["partial"]!.name
        bidName.removeAll(where: {numbers.contains($0)})
        
        if (modelAction != nil) {
            self.roundModelInfo["strategy"]!.append(model.lastAction(slot: "strategy")!)
            self.roundModelInfo["bids"]!.append(model.lastAction(slot: "my-move")!)
            if bidName.contains("final-offer") {
                self.roundPlayerInfo["type"]!.append("decision")
                let response = Int(Double(modelAction!.description) ?? 0)
                let modelBid = response + self.roundModelBids.last!
                self.roundModelBids.append(modelBid)
                self.roundPlayerBids.append(bid)
                return 3
            }
            
            self.roundPlayerInfo["bids"]!.append(String(bid - roundPlayerBids.last!))
            if (modelAction!.description == "reject")
            {
                self.roundModelInfo["type"]!.append("decision")
                print("I reject, come up with something better :')")
                return 2
            }
            if (modelAction!.description == "accept")
            {
                print("I accept your offer!")
                self.roundModelInfo["type"]!.append("decision")
                self.roundPlayerBids.append(bid)
                return 1
            }
            if (modelAction!.description == "quit")
            {
                self.roundModelInfo["type"]!.append("quit")
                print("I quit!")
                return 2
            }
            else {
                let response = Int(Double(modelAction!.description) ?? 0)
                let modelBid = response + self.roundModelBids.last!
                
                if (modelBid + bid <= 9)
                {
                    print("I accept your offer!")
                    self.roundModelBids.append(modelBid)
                    self.roundPlayerBids.append(bid)
                    return 1
                }
                self.roundModelInfo["type"]!.append("bid")
                self.roundPlayerInfo["type"]!.append("bid")
                updateStrategy(bid, modelBid)
                
                self.roundModelBids.append(modelBid)
                self.roundPlayerBids.append(bid)
            }
        }
        else {
            return -1
        }
        return 0
    }
    
    mutating func updateStrategy(_ playerBid: Int, _ modelBid: Int){
        let chunk = model.generateNewChunk()

        chunk.setSlot(slot: "isa", value: "game-state")
        chunk.setSlot(slot: "state", value: "game")
        chunk.setSlot(slot: "op-mns", value: suggestedPlayerMNS)
        chunk.setSlot(slot: "op-bid-diff", value: Double(abs(playerBid - Int(suggestedPlayerMNS))))
        chunk.setSlot(slot: "op-move", value: Double(playerBid - self.roundPlayerBids.last!))
        chunk.setSlot(slot: "my-move", value: Double(modelBid - self.roundModelBids.last!))
        
        //print(chunk)
        model.buffers["action"] = chunk
        model.run()
        
    }
    mutating func setMNS(){
        let pair = mnsPairs[Int.random(in: 0...11)]
        self.playerMNS = pair[0]
        self.modelMNS = pair[1]
    }

}
