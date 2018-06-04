package com.example.jpetstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CategoryListController { 

@RequestMapping(value="/shop/{type}/categoryList.do")
public ModelAndView view(@PathVariable("type") String type) throws Exception {

ModelAndView mv = new ModelAndView("tiles/categoryList");
mv.addObject("type", type);

return mv;
}
}