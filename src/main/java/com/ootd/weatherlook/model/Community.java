package com.ootd.weatherlook.model;

import java.sql.Date;
import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("comm")
public class Community {
	private int post_id;
	private String title;
	private String read_count;
	private Date reg_date;
	private String content;
	private String nick;
	private String category;
}
