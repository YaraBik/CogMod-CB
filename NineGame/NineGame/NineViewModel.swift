import SwiftUI

class NineViewModel: ObservableObject {
    
    @Published var model: NineModel
    
    init(){
        model = NineModel()
        self.model.bidString = getBidsString()
        model.resetModelTrial()
    }
    
    func reset() {
        model.reset()
        model.resetModelTrial()
    }
    
    func resetQuit(){
        let chunk = model.model.generateNewChunk()
        chunk.setSlot(slot: "isa", value: "game-state")
        chunk.setSlot(slot: "state", value: "reset")
        
        model.model.buffers["action"] = chunk
        model.model.run()
        model.resetModelTrial()
    }
    
    var state: Int = 0
    var flag: Int?
    var playerMNS: Int {model.playerMNS}
    var suggestedModelMNS: Double { model.suggestedModelMNS }
    var bid: Int? { model.highlightedBid }
    var highlightedMNS: Int?
    var playerBid: Int?
    var modelBid: Int?
    var bidString: String { model.bidString }
    
    func switchState(_ s: Int) {
        state = s
    }
    
    func getHistory() -> String {
        var ms = ""
        for (index, bid) in model.roundPlayerBids.enumerated() {
            ms += "Round \(index + 1), 😀: \(bid)\n"
            if (model.roundModelBids.count > index)
            {
                ms += "Round \(index + 1), 🤖: \(model.roundModelBids[index])\n"
            }
        }
        return ms
    }

    func getBidsString() -> String {
        var sBid = ""
        if (self.playerBid != nil)
        {
            sBid += "😀 wants: \(self.playerBid!)\n"
        }
        else{
            sBid += "😀 wants: _\n"
        }
        if (self.modelBid != nil)
        {
            sBid += "🤖 wants: \(self.modelBid!)\n"
        }
        else{
            sBid += "🤖 wants: _\n"
        }
        return sBid
    }
    func chooseMNS(_ mns: Int) {
        model.chooseMNS(mns)
    }
    
    func highlightBid(_ bid: Int?) {
        model.highlightedBid = bid
    }
    
    func chooseBid(_ bid: Int, _ f: Bool) {
        self.modelBid = nil
        self.playerBid = bid
        //TODO: add final functionality
        self.flag = model.chooseBid(bid, final: f)
        self.modelBid = self.model.roundModelBids.last
        self.model.bidString = self.getBidsString()
        self.playerBid = nil
        
        if (self.flag == 1) {
            updatePlayerStrategyHistory()
            print(model.roundModelInfo)
            print(model.roundPlayerInfo)
            self.model.bidString = "Model accepted your bid"
            let currentModelScore = self.model.roundModelBids.last! - self.model.modelMNS
            let currentPlayerScore = self.model.roundPlayerBids.last! - self.model.playerMNS
            self.model.modelScore += (currentModelScore)
            self.model.playerScore += (currentPlayerScore)
            
            updateDM(currentModelScore, currentPlayerScore)
            
            self.model.resetModelTrial()
        }
        else if (self.flag == 2) {
            updatePlayerStrategyHistory()
            print(model.roundModelInfo)
            print(model.roundPlayerInfo)
            self.model.bidString = "Model rejected your bid"
            
            let chunk = model.model.generateNewChunk()
            chunk.setSlot(slot: "isa", value: "game-state")
            chunk.setSlot(slot: "state", value: "reset")
            
            model.model.buffers["action"] = chunk
            model.model.run()
            
            self.model.resetModelTrial()
        }
        
        else if (self.flag == 3) {
            updatePlayerStrategyHistory()
            print(model.roundModelInfo)
            print(model.roundPlayerInfo)
            self.model.bidString = "The model wants \(model.roundModelBids.last!) as their final offer"
            model.modelFinal = true
        }
    }
    
    func updatePlayerStrategyHistory(){
        var modelStrategy = model.roundModelInfo["strategy"]![1...(model.roundModelInfo["strategy"]!.count-1)]
        modelStrategy.append("neutral")
        model.roundPlayerInfo["strategy"] = Array(modelStrategy)
    }
    
    func acceptOffer(){
        
        self.model.roundPlayerInfo["bids"]!.append("accept")
        print("You accept the model's offer")
        let currentModelScore = self.model.roundModelBids.last! - self.model.modelMNS
        let currentPlayerScore = (9 - self.model.roundModelBids.last!) - self.model.playerMNS
        self.model.modelScore += (currentModelScore)
        self.model.playerScore += (currentPlayerScore)
        updateDM(currentModelScore, currentPlayerScore)
        self.model.resetModelTrial()
    }
    
    func declineOffer(){
        self.model.roundPlayerInfo["bids"]!.append("decline")
        let chunk = model.model.generateNewChunk()
        
        chunk.setSlot(slot: "isa", value: "game-state")
        chunk.setSlot(slot: "state", value: "reset")
        
        model.model.buffers["action"] = chunk
        model.model.run()
        print("you declined to models offer.")
        self.model.resetModelTrial()
    }
    
    func updateDM(_ modelScore: Int, _ playerScore: Int){
        let chunk = model.model.generateNewChunk()

        if (modelScore == playerScore) {
            chunk.setSlot(slot: "isa", value: "game-state")
            chunk.setSlot(slot: "state", value: "reset")
            
            model.model.buffers["action"] = chunk
            model.model.run()
        }
        else {
            var winner: [String: Array<String>]?
            var loser: [String: Array<String>]?
            var mns: Int?
            
            if (modelScore > playerScore) {
                winner = model.roundModelInfo
                loser = model.roundPlayerInfo
                mns = model.modelMNS
            }
            else {
                winner = model.roundPlayerInfo
                loser = model.roundModelInfo
                mns = model.playerMNS
            }
            for i in 0...(winner!["bids"]!.count-1) {
                let chunk = self.model.model.generateNewChunk()
                chunk.setSlot(slot: "isa", value: "game-state")
                chunk.setSlot(slot: "state", value: "feedback")
                chunk.setSlot(slot: "type-move", value: winner!["type"]![i])
                chunk.setSlot(slot: "strategy", value: winner!["strategy"]![i])
                chunk.setSlot(slot: "mns", value: String(mns!))
                
                if (winner!["type"]![i] == "opening" || (winner!["type"]![i] == "claim")) {
                    chunk.setSlot(slot: "bid-diff", value: "nil")
                }
                else{
                    chunk.setSlot(slot: "bid-diff", value: winner!["bids"]![i-1])
                }
                if (winner!["type"]![i] == "claim") {
                    chunk.setSlot(slot: "op-move", value: "nil")
                }
                else{
                    chunk.setSlot(slot: "op-move", value: loser!["bids"]![i-1])
                }
                chunk.setSlot(slot: "my-move", value: winner!["bids"]![i])
                print("Generated chunk!\n")
                print(chunk)
                
                self.model.model.buffers["action"] = chunk
                self.model.model.run()
            }
        }
    }
}
