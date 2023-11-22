package com.ootd.weatherlook.dao;

import java.util.List;
import java.util.Map;

import com.ootd.weatherlook.model.MainBoard;
import com.ootd.weatherlook.model.Search;
import com.ootd.weatherlook.model.SearchResult;

public interface MainDao {

	
	public List<MainBoard> getMainList(Search search);
	public int getMainCount(Search search);
	
	public List<SearchResult> getSearchList(Search search);
	public int getSearchCount(Search search);
	
	public List<MainBoard> getWeatherList(Search search);
}
