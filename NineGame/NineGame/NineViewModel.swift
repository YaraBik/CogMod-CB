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
    
    var flag: Int?
    var playerMNS: Int {model.playerMNS}
    var suggestedModelMNS: Double { model.suggestedModelMNS }
    var bid: Int? { model.highlightedBid }
    var highlightedMNS: Int?
    var playerBid: Int?
    var modelBid: Int?
    var bidString: String { model.bidString }
    
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
            self.model.bidString = "Model accepted your bid"
            let currentModelScore = self.model.roundModelBids.last! - self.model.modelMNS
            let currentPlayerScore = self.model.roundPlayerBids.last! - self.model.playerMNS
            self.model.modelScore += (currentModelScore)
            self.model.playerScore += (currentPlayerScore)
            
            let chunk = model.model.generateNewChunk()

            //if (currentModelScore == currentPlayerScore)
        
            chunk.setSlot(slot: "isa", value: "game-state")
            chunk.setSlot(slot: "state", value: "reset")
            
            model.model.buffers["action"] = chunk
            model.model.run()
        
    
            self.model.resetModelTrial()
        }
        else if (self.flag == 2) {
            self.model.bidString = "Model rejected your bid"
            
            let chunk = model.model.generateNewChunk()
            chunk.setSlot(slot: "isa", value: "game-state")
            chunk.setSlot(slot: "state", value: "reset")
            
            model.model.buffers["action"] = chunk
            model.model.run()
            
            self.model.resetModelTrial()
        }
        
        //let seconds = 0.0
        //DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        //    self.modelBid = self.model.modelBids.last
        //    self.model.bidString = self.getBidsString()
        //    self.playerBid = nil
        //}
    }
}
