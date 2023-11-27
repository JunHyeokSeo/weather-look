package com.ootd.weatherlook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ootd.weatherlook.model.MainBoard;
import com.ootd.weatherlook.model.Report;
import com.ootd.weatherlook.model.Search;
import com.ootd.weatherlook.model.SearchResult;
import com.ootd.weatherlook.model.Weather;
import com.ootd.weatherlook.service.MainServiceImpl;

@Controller
public class MainController {

	@Autowired
	private MainServiceImpl mainpageservice;

	@RequestMapping("/")
	public String test() {

		// 트래킹 ->
		StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
		StackTraceElement caller = stackTrace[1];
		System.out.println("[경로 추적] : " + caller.getClassName() + "." + caller.getMethodName());
		// <- 트래킹

		return "redirect:main";
	}

	@RequestMapping("main")
	public String main(@RequestParam(value = "page", defaultValue = "1") int page, HttpServletRequest request, Model model) {
		
		String temperature = request.getParameter("temperature");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		
		if(request.getParameter("temperature") != null
				&& request.getParameter("latitude") != null
				&& request.getParameter("longitude") != null) {
			
			return "redirect:weather?temperature="+temperature
					+"?latitude="+latitude
					+"?longitude="+longitude
					+"?page="+page;
		}
		
		return "redirect:recent?page="+page;
	}
	
	
	
	// 쇼핑후기 + 데일리 게시판 최신순 출력
	@RequestMapping("recent")
	public String mainpage(HttpServletRequest request, Model model) {

		// 트래킹 ->
		StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
		StackTraceElement caller = stackTrace[1];
		System.out.println("[경로 추적] : " + caller.getClassName() + "." + caller.getMethodName());
		// <- 트래킹

		// 공통 설정 ->
		int page = Integer.parseInt(request.getParameter("page"));
		int numberset = 9;
		int pageset = 10;
		int startrow = 1 + (page - 1) * numberset;
		int endrow = page*numberset;
		List<MainBoard> mainlist = new ArrayList<MainBoard>();
		Search search = new Search();
		search.setNumberset(numberset);
		search.setStartrow(startrow);
		search.setEndrow(endrow);
		search.setPage(page);
		// <- 공통 설정
		
		int listcount = mainpageservice.getMainCount(search);
		
		// 메인보드 출력물 갯수 연산 ->
		int maxpage = listcount / numberset + ((listcount % numberset == 0) ? 0 : 1);
		int startpage = ((page - 1) / pageset) * numberset + 1; 
		int endpage = startpage + pageset - 1; 
		if (endpage > maxpage)
			endpage = maxpage;
		// <- 메인보드 출력물 갯수 연산
		mainlist = mainpageservice.getMainList(search);

		System.out.println("mainlist : " + mainlist);
		model.addAttribute("mainlist", mainlist);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("listcount", listcount);

		return "main/mainpage";

	}

	@RequestMapping("detail")
	public String detail(HttpServletRequest request, Model model) {
		
		// 트래킹 ->
		StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
		StackTraceElement caller = stackTrace[1];
		System.out.println("[경로 추적] : " + caller.getClassName() + "." + caller.getMethodName());
		// <- 트래킹
		
		String type_name = request.getParameter("type_name");
		String post_id = request.getParameter("post_id");
		System.out.println("type_name : " + type_name);
		System.out.println("post_id : " + post_id);
		
		if(type_name.equals("daily"))
			System.out.println("daily 게시판 실행");
		if(type_name.equals("review"))
			System.out.println("review 게시판 실행");
		if(type_name.equals("community"))
			System.out.println("community 게시판 실행");
		
		
		return "";
	}


	

}
