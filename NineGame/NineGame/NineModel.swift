import Foundation


func last_x_elements(suffix x: Int, array a: Array<Int>) -> Array<Int>{
    var a = a
    a.reverse()
    return Array(a[...x])
}
struct NineModel {

    var model = Model()
    var playerBid: Int = 0
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
        self.bidString = ""
        roundPlayerBids = [0]
        roundModelBids = [0]
        self.setMNS()
        
        let chunk = model.generateNewChunk()
        chunk.setSlot(slot: "isa", value: "game-state")
        chunk.setSlot(slot: "my-mns", value: Double(modelMNS))
        
        model.buffers["action"] = chunk
        model.run()
        
        let modelAction = model.lastAction(slot: "my-move")
        
        //print(model.dm.chunks)
        
        if (modelAction != nil) {
            self.suggestedModelMNS = Double(self.modelMNS) + (Double(modelAction!.description) ?? 0)
            //updateStrategy(Double(suggestedPlayerMNS), self.modelMNS))
        }
        else {
            print("No action returned.")
        }
    
    }

    mutating func chooseMNS(_ mns: Int) {
        print("You selected an MNS of: \(mns)")
        self.suggestedPlayerMNS = Double(mns)
    }
    
    mutating func chooseBid(_ bid: Int, final f: Bool) -> Int{
        //:')
        let chunk = model.generateNewChunk()
        let isa = "game-state"
        let state = "game"
        let opFinal = f ? "yes" : "no"
        let opMove: Value?
        let myBidDiff = (roundModelBids.count == 1) ? Value.Empty : Value.Number(Double(abs(self.roundModelBids.last! - modelMNS)))
        
        
        if (roundModelBids.count == 1)
        {
            opMove = Value.Number(Double(bid - roundPlayerBids.last!))
        }
        else{
            let lastTwoBids = Array(self.roundPlayerBids.suffix(2))
            opMove = Value.Number(Double(lastTwoBids[1] - lastTwoBids[0]))
        }
        //myBidDiff = Value.Number(Double(abs(self.roundModelBids.last! - modelMNS)))
        
        
        chunk.setSlot(slot: "isa", value: isa)
        chunk.setSlot(slot: "state", value: state)
        chunk.setSlot(slot: "my-bid-diff", value: myBidDiff)
        chunk.setSlot(slot: "op-move", value: opMove!)
        chunk.setSlot(slot: "op-final", value: opFinal)
        
        model.buffers["action"] = chunk
        model.run()
        
        let modelAction = model.lastAction(slot: "my-move")
        //let strategy = model.lastAction(slot: "strategy")
        
        if (modelAction != nil) {
            if (modelAction!.description == "reject")
            {
                print("I reject, come up with something better :')")
                return 2
            }
            if (modelAction!.description == "accept")
            {
                print("I accept your offer!")
                self.roundPlayerBids.append(bid)
                return 1
            }
            if (modelAction!.description == "quit")
            {
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
        
        print("update strategy:\n")
        print(suggestedPlayerMNS)
        print(Double(abs(playerBid - Int(suggestedPlayerMNS))))
        print(Double(playerBid - self.roundPlayerBids.last!))
        print(Double(modelBid - self.roundModelBids.last!))
        

        chunk.setSlot(slot: "isa", value: "game-state")
        chunk.setSlot(slot: "state", value: "game")
        chunk.setSlot(slot: "op-mns", value: suggestedPlayerMNS)
        chunk.setSlot(slot: "op-bid-diff", value: Double(abs(playerBid - Int(suggestedPlayerMNS))))
        chunk.setSlot(slot: "op-move", value: Double(playerBid - self.roundPlayerBids.last!))
        chunk.setSlot(slot: "my-move", value: Double(modelBid - self.roundModelBids.last!))
        
        print(chunk)
        model.buffers["action"] = chunk
        model.run()
    }
    
    mutating func setMNS(){
        self.playerMNS = Int.random(in: 1...5)
        self.modelMNS = Int.random(in: 1...5)
    }

}
