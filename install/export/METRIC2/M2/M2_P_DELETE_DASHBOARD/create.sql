CREATE PROCEDURE METRIC2.M2_P_DELETE_DASHBOARD(dashboard_id INT) LANGUAGE SQLSCRIPT AS BEGIN DELETE FROM METRIC2.M2_DWP_HISTORY WHERE DASHBOARD_WIDGET_PARAM_ID in (SELECT DASHBOARD_WIDGET_PARAM_ID FROM METRIC2.M2_DASHBOARD_WIDGET_PARAMS INNER JOIN METRIC2.M2_DASHBOARD_WIDGET ON METRIC2.M2_DASHBOARD_WIDGET_PARAMS.DASHBOARD_WIDGET_ID = METRIC2.M2_DASHBOARD_WIDGET.DASHBOARD_WIDGET_ID WHERE DASHBOARD_ID = :dashboard_id); DELETE FROM METRIC2.M2_DASHBOARD_WIDGET_PARAMS WHERE DASHBOARD_WIDGET_ID in (SELECT DASHBOARD_WIDGET_ID FROM METRIC2.M2_DASHBOARD_WIDGET WHERE DASHBOARD_ID = :dashboard_id); DELETE FROM metric2.m2_dashboard_widget WHERE dashboard_widget_id in (SELECT DASHBOARD_WIDGET_ID FROM METRIC2.M2_DASHBOARD_WIDGET WHERE DASHBOARD_ID = :dashboard_id); DELETE FROM metric2.m2_alert WHERE dashboard_widget_id in (SELECT DASHBOARD_WIDGET_ID FROM METRIC2.M2_DASHBOARD_WIDGET WHERE DASHBOARD_ID = :dashboard_id); DELETE FROM metric2.m2_alert_history WHERE dashboard_widget_id in (SELECT DASHBOARD_WIDGET_ID FROM METRIC2.M2_DASHBOARD_WIDGET WHERE DASHBOARD_ID = :dashboard_id); DELETE FROM METRIC2.M2_DASHBOARD WHERE DASHBOARD_ID = :dashboard_id; END;