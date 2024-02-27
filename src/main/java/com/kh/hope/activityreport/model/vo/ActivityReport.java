package com.kh.hope.activityreport.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ActivityReport {
	
	private int reportNo;
	private String reportTitle;
	private String reportContent;
	private int count;
	private Date createDate;
	public int userNo;
	
	private Date activityStartDate;
	private Date activityEndDate;
}
