dofile(getScriptPath().."\\hacktrade.lua")

function Robot()

    feed = MarketData{
        market="SPBFUT",
        ticker="RIU7",
    }

    order = SmartOrder{
        account="SPBFUT00Z43",
        client="SPBFUT00Z43",
        market="SPBFUT",
        ticker="RIU7",
    }

    riu = Indicator{
        tag="riu",
    }

	sma = Indicator{
        tag="sma",
    }
    
    size = 1

    while true do
        if riu.closes_0[-1] > riu.opens_0[-1] then
          order:update(feed.offers, size)
        else
          order:update(feed.last, -size)
        end
        Trade()
    end
end
