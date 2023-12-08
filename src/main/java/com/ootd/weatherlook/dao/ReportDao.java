package com.ootd.weatherlook.dao;

import java.util.List;

import com.ootd.weatherlook.model.Report;
import com.ootd.weatherlook.model.Search;

public interface ReportDao {

	public void removeDaily(int post_id); 
	public void removeReview(int post_id); 
	public void removeCommunity(int post_id); 
	public List<Report> getReportList(Search search);
	public int getReportCount(Search search);
}
