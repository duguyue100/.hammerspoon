-- Utility Function
--
-- Author: Yuhuang Hu
-- Email : duguyue100@gmail.com

function reload_config()
    hs.reload()
end

-- Pomodoro method related

function count_down(time, msg)
    function message(msg)
        hs.notify.new({title="DGYHS", informativeText=msg}):send()
        hs.speech.new("Zarvox"):speak(msg)
    end
    hs.timer.doAfter(time, function() message(msg) end)
end

function count_25min(msg)
    count_down(hs.timer.minutes(25), msg)
end

function count_5min(msg)
    count_down(hs.timer.minutes(5), msg)
end

function pomodoro_cycle()
    count_25min("The time is UP! Take a rest.")
    count_5min("The rest time is UP!")
end

