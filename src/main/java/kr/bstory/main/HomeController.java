package kr.bstory.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/main/")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "index.ino", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("\n\t===========Welcome home!===========");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main/home";
	}
	

	@RequestMapping(value = "explore.ino", method = RequestMethod.GET)
	public String explore(Model model) {
		
		logger.info("\n\t===========Welcome explore!===========");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main/explore";
	}

	@RequestMapping(value = "listing.ino", method = RequestMethod.GET)
	public String listing(Model model) {
		
		logger.info("\n\t===========Welcome listing!===========");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main/listing/listing";
	}

	@RequestMapping(value = "singleListing.ino", method = RequestMethod.GET)
	public String singleListing(Model model) {
		
		logger.info("\n\t===========Welcome singleListing!===========");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main/listing/single-listing";
	}
	
	@RequestMapping(value = "contact.ino", method = RequestMethod.GET)
	public String contact(Model model) {
		
		logger.info("\n\t===========Welcome contact!===========");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main/contact";
	}
	
	
}
