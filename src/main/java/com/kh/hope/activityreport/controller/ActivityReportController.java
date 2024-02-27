package com.kh.hope.activityreport.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hope.activityreport.model.service.ActivityReportService;
import com.kh.hope.activityreport.model.vo.ActivityReport;
import com.kh.hope.attachment.model.vo.Attachment;
import com.kh.hope.board.model.vo.Board;
import com.kh.hope.common.Template.model.vo.Pagenation;
import com.kh.hope.common.model.vo.PageInfo;
import com.kh.hope.user.model.vo.User;

import edu.emory.mathcs.backport.java.util.Arrays;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ActivityReportController {
	
	@Autowired
	private ActivityReportService service;
	
	@GetMapping("/activityreport")
	public String ReportList(Model m, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam Map<String, Object> map) {
		int listCount = service.selectListCount(map);
		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<ActivityReport> list = service.reportList(pi, map);
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);
		m.addAttribute("param", map);

		return "activityreport/activityreport";
	}
	
	@GetMapping("/activityreport/{arno}")
	public String selectActivityReport(@PathVariable("arno") int reportNo, Model m, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {
		
		ActivityReport ar = service.selectActivityReport(reportNo);

		if (ar != null) {

			int userNo = 0;
			User loginUser = (User) session.getAttribute("loginUser");
			if (loginUser != null) {
				userNo = loginUser.getUserNo();
			}

			if (ar.getUserNo() != userNo) {
				Cookie cookie = null;
				Cookie[] cArr = req.getCookies();
				if (cArr != null && cArr.length > 0) {
					for (Cookie c : cArr) {
						if ("readActivityReportNo".equals(c.getName())) {
							cookie = c;
							break;
						}
					}
				}
				int result = 0;
				if (cookie == null) {
					cookie = new Cookie("readActivityReportNo", reportNo + "");
					result = service.increaseCount(reportNo);

				} else {
					String[] arr = cookie.getValue().split("/");
					List<String> list = Arrays.asList(arr);
					if (list.indexOf(reportNo + "") == -1) {
						result = service.increaseCount(reportNo);
						cookie.setValue(cookie.getValue() + "/" + reportNo);
					}
				}
				if (result > 0) {
					ar.setCount(ar.getCount() + 1);
					cookie.setPath(req.getContextPath());
					cookie.setMaxAge(1 * 60 * 60);
					res.addCookie(cookie);
				}
			}
		} else {
			m.addAttribute("errorMsg", "조회실패");
			return "common/errorPage";
		}
		m.addAttribute("ar", ar);

		return "activityreport/activityreportDetail";
	}
}
