package com.ootd.weatherlook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DailyDao {

	@Autowired
	private SqlSession session;
}
