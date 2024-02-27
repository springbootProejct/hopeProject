package com.kh.hope.activityreport.model.service;

import java.util.List;
import java.util.Map;

import com.kh.hope.activityreport.model.vo.ActivityReport;
import com.kh.hope.common.model.vo.PageInfo;

public interface ActivityReportService {
	
	/* 활동보고서 list */
	int selectListCount(Map<String, Object> map);
	
	List<ActivityReport> reportList(PageInfo pi, Map<String, Object> map);
	
	
	
	
	ActivityReport selectActivityReport(int reportNo);
	
	int increaseCount(int reportNo);
}
