package com.kh.hope.activityreport.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.hope.activityreport.model.vo.ActivityReport;
import com.kh.hope.common.model.vo.PageInfo;

@Repository
public class ActivityReportDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	/* 활동보고서 리스트 */
	public int selectListCount(Map<String, Object> map) {
		
		return session.selectOne("activityreportMapper.selectListCount",map);
	}

	public List<ActivityReport> reportList(PageInfo pi, Map<String, Object> map) {
		
		int limit = pi.getBoardLimit();
		int offset=(pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return session.selectList("activityreportMapper.reportList",map,rowBounds);
	}
	
	
	/* 활동보고서 상세보기 */
	public ActivityReport selectActivityReport(int reportNo) {
		return session.selectOne("activityreportMapper.selectActivityReport",reportNo);
	}

	public int increaseCount(int reportNo) {
		return session.update("activityreportMapper.increaseCount",reportNo);
	}

	
	
	
}
