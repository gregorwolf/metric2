

function getDataPoint(){
    return sqlLib.executeRecordSetObj("SELECT value FROM METRIC2.m2_DWP_HISTORY WHERE dwp_hist_id = (SELECT MAX(dwp_hist_id) FROM METRIC2.M2_DWP_HISTORY WHERE dashboard_widget_param_id = " + dashboardwidgetparamid + ")");
}


function updateWigetValue(){
    if (datapoint){
        //Accept just the single data point from the request parameter
        return widgetLib.insertWidgetHistory(dashboardwidgetid, 'SQL1', datapoint, dashboardwidgetparamid);
    } else {
        //Ingest JSON body payload, needs the dashboardwidgetid and datapoint
        return $.request.body.asString();
    }
}