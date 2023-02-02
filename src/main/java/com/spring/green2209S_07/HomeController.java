package com.spring.green2209S_07;

import com.spring.green2209S_07.service.MainService;
import com.spring.green2209S_07.vo.HospitalInfoVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

@Controller
public class HomeController {

	@Autowired
	MainService mainService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );

//		============================================================================================================

		// 메인 뷰에 뿌려줄 지역 리스트 가져오기

//		HospitalInfoVO hospitalInfoVO=mainService.getSidoList();

		ArrayList<HospitalInfoVO> sidoCdNmVOS=mainService.getSidoList();

		ArrayList<HospitalInfoVO> sgguCdNmVOS=mainService.getSgguList();

		model.addAttribute("sidoCdNmVOS", sidoCdNmVOS);
		model.addAttribute("sgguCdNmVOS", sgguCdNmVOS);

		return "home";
	}

}
