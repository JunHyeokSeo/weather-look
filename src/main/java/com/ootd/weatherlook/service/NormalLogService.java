package com.ootd.weatherlook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ootd.weatherlook.dao.NormalLogDao;

@Service
public class NormalLogService {

	@Autowired
	private NormalLogDao memberDao;

	public int idcheck(String id) {
		return memberDao.idcheck(id);
	}

	public int nickcheck(String nick) {
		return memberDao.nickcheck(nick);
	}
	
	
}