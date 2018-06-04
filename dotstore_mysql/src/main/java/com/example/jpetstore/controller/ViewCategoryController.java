package com.example.jpetstore.controller;

import org.springframework.beans.support.PagedListHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.example.jpetstore.domain.Category;
import com.example.jpetstore.domain.Product;
import com.example.jpetstore.service.PetStoreFacade;

/**
 * @author Juergen Hoeller
 * @since 30.11.2003
 * @modified-by Changsup Park
 */
@Controller
@SessionAttributes({"category", "productList"})
public class ViewCategoryController { 
private PetStoreFacade petStore;

@Autowired
public void setPetStore(PetStoreFacade petStore) {
this.petStore = petStore;
}

@RequestMapping("/shop/{type}/viewCategory.do")
public String handleRequest(
@RequestParam(value="categoryId", required = false, defaultValue = "DOGS") String categoryId,
ModelMap model,
@PathVariable("type") String type
) throws Exception {
Category category = this.petStore.getCategory(categoryId);
PagedListHolder<Product> productList = new PagedListHolder<Product>(this.petStore.getProductListByCategory(categoryId));
productList.setPageSize(4);
model.put("category", category);
model.put("productList", productList);
model.put("type", type);
return "tiles/Category";
}

@RequestMapping("/shop/{type}/viewCategory2.do")
public String handleRequest2(
@RequestParam("page") String page,
@ModelAttribute("category") Category category,
@ModelAttribute("productList") PagedListHolder<Product> productList,
BindingResult result,
ModelMap model,
@PathVariable("type") String type) throws Exception {
if (category == null || productList == null) {
throw new IllegalStateException("Cannot find pre-loaded category and product list");
}
if ("next".equals(page)) { productList.nextPage(); }
else if ("previous".equals(page)) { productList.previousPage(); }
model.put("type", type);
return "tiles/Category";
}
}