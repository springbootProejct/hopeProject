package com.kh.hope.activityreport.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hope.activityreport.model.dao.ActivityReportDao;
import com.kh.hope.activityreport.model.vo.ActivityReport;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.common.model.vo.PageInfo;

import jakarta.servlet.ServletContext;

@Service
public class ActivityReportServiceImp implements ActivityReportService{
	

	@Autowired
	private ActivityReportDao dao;
	
	/* 활동보고서 리스트 */
	@Override
	public int selectListCount(Map<String, Object> map) {
		return dao.selectListCount(map);
	}
	
	@Override
	public List<ActivityReport> reportList(PageInfo pi, Map<String, Object> map) {
		return dao.reportList(pi,map);
	}
	
	/* 활동보고서 상세보기 */
	@Override
	public ActivityReport selectActivityReport(int reportNo) {
		return dao.selectActivityReport(reportNo);
	}
	@Override
	public int increaseCount(int reportNo) {
		return dao.increaseCount(reportNo);
	}

	@Override
	public int insertActivityReport(ActivityReport activityReport) {
		return dao.insertActivityReport(activityReport);
	}


	
}







