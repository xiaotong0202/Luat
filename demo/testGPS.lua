--- 模块功能：testTask
-- @module test
-- @author openLuat
-- @license MIT
-- @copyright openLuat
-- @release 2017.02.17
require "gps"
require "agps"
module(..., package.seeall)
gps.setup()
gps.open()
-- demo任务演示更新星历，本地如果没有就从网上下载星历，每隔6小时自动更新1次星历。
sys.taskInit(function()
    local data = agps.getGPD(30000)
    while true do
        while not gps.update(data) do log.info("AGPS update-gpd status:", "error")sys.wait(3 * 60000) end
        log.info("AGPS update-gpd status:", "success")
        sys.wait(3 * 60000)
        refresh(30000)
    end
end)
