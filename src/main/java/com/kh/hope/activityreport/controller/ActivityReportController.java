package com.kh.hope.activityreport.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hope.activityreport.model.service.ActivityReportService;
import com.kh.hope.activityreport.model.vo.ActivityReport;
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
	
	@GetMapping("/activityreportinsert")
	public String showActivityReportForm() {
		// 활동보고서 작성 폼을 보여주는 페이지로 이동
		return "activityreport/activityreportInsert";
	}
	
	@PostMapping("/activityreportinsert")
	public String insertActivityReport(
			@RequestParam("reportTitle") String reportTitle,
		    @RequestParam("reportContent") String reportContent,
		    @RequestParam("activityStartDate") Date activityStartDate,
		    @RequestParam("activityEndDate") Date activityEndDate,
			RedirectAttributes redirectAttributes) {
		// 사용자로부터 입력받은 파라미터 값을 이용하여 ActivityReport 객체를 생성
	    ActivityReport activityReport = new ActivityReport();
	    activityReport.setReportTitle(reportTitle);
	    activityReport.setReportContent(reportContent);
	    activityReport.setActivityStartDate(activityStartDate);
	    activityReport.setActivityEndDate(activityEndDate);

	    // 서비스를 통해 활동 보고서를 DB에 저장
	    int result = service.insertActivityReport(activityReport);
	    
	    if(result > 0) {
	        // 저장 성공 시 메시지를 리다이렉트한 페이지로 전달
	        redirectAttributes.addFlashAttribute("successMessage", "활동 보고서가 성공적으로 저장되었습니다.");
	    } else {
	        // 저장 실패 시 메시지를 리다이렉트한 페이지로 전달
	        redirectAttributes.addFlashAttribute("errorMessage", "활동 보고서 저장에 실패하였습니다. 다시 시도해주세요.");
	    }
	    
	    return "redirect:/activityreport"; // 다시 입력 폼으로 리다이렉트
	}
	
}