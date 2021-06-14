package xyz.sumtplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class IndexController {

	@GetMapping("index")
	public void index() {
		log.info("index... start");
		log.info("indexList......");

	}

	@GetMapping("innerPage")
	public void innerPage() {
		log.info("innerPage..");
	}

	@GetMapping("aboutUs")
	public void aboutUs() {
		log.info("aboutUs..");
	}

	@GetMapping("gallery")
	public void gallery() {
		log.info("gallery..");
	}
	
	@GetMapping("zaksal")
	public void zaksal() {
		log.info("zaksal..");
	}
}
