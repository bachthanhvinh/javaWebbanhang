//package controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//import beans.Product;
//import dao.DaoProduct;
//
//@Controller
//public class HomeController {
//
//    @Autowired
//    private DaoProduct daoProduct;
//
////    @GetMapping("/")
////    public String redirectToProductView() {
////        return "redirect:/product_view";
////    }
//    @GetMapping("admin/")
//    public String showProductView() {
//        return "redirect:admin/product_view"; // CHỈ cần sửa thêm dòng này
//    }
//
//    @GetMapping("/product_create_form")
//    public String showForm(Model model) {
//        model.addAttribute("product", new Product());
//        return "product_create_form"; // JSP form để thêm mới
//    }
//
//    @PostMapping("/save")
//    public String save(@ModelAttribute("product") Product product, BindingResult result) {
//        if (result.hasErrors()) {
//            return "product_create_form";
//        }
//        System.out.println("Dữ liệu sản phẩm mới: " + product);
//        daoProduct.save(product);
//        return "redirect:/product_view";
//    }
//
//    @GetMapping("/product_view")
//    public String viewProducts(Model model) {
//        List<Product> list = daoProduct.getProducts();
//        model.addAttribute("list", list);
//        return "product_view"; // JSP list sản phẩm
//    }
//
//    @GetMapping("/editproduct/{productId}")
//    public String edit(@PathVariable int productId, Model model) {
//        Product product = daoProduct.getProductById(productId);
//        model.addAttribute("product", product);
//        return "product_edit_form"; // JSP form để sửa sản phẩm
//    }
//
//    @PostMapping("/editsave")
//    public String editSave(@ModelAttribute("product") Product product, BindingResult result) {
//        if (result.hasErrors()) {
//            System.out.println("Có lỗi trong dữ liệu sửa sản phẩm: " + result.getAllErrors());
//            return "product_edit_form";
//        }
//        daoProduct.update(product);
//        return "redirect:/product_view";
//    }
//
//    @GetMapping("/deleteproduct/{productId}")
//    public String delete(@PathVariable int productId) {
//        daoProduct.delete(productId);
//        return "redirect:/product_view";
//    }
//}
package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import beans.Product;
import dao.DaoProduct;

@Controller
public class HomeController {

    @Autowired
    private DaoProduct daoProduct;

    // Chuyển hướng từ trang gốc về trang xem sản phẩm
    @GetMapping("/")
    public String showAdminPage() {
        return "admin/dashboard"; // Dẫn đến /WEB-INF/views/admin/admin.jsp
    }
    
//    @GetMapping("/product_view")
//    public String viewProducts(Model model) {
//        List<Product> list = daoProduct.getProducts();
//        model.addAttribute("list", list);
//        model.addAttribute("bodyPage", "product/product_view.jsp"); // phần body
//        String currentPath = Request.getRequestURI(); // Lấy đường dẫn người dùng thực sự gọi
//        model.addAttribute("currentPath", currentPath); // Truyền xuống JSP
//        return "admin/dashboard"; // layout chính
//    }
    @GetMapping("/product_view")
    public String viewProducts(HttpServletRequest request, Model model) {
        List<Product> list = daoProduct.getProducts();
        model.addAttribute("list", list);
        model.addAttribute("bodyPage", "product/product_view.jsp");

        // ✅ Lấy đường dẫn hiện tại
        String currentPath = request.getRequestURI();
        model.addAttribute("currentPath", currentPath);

        return "admin/dashboard";
    }


    // Hiển thị danh sách sản phẩm
//    @GetMapping("/product_view")
//    public String viewProducts(Model model) {
//        List<Product> list = daoProduct.getProducts();
//        model.addAttribute("list", list);
//        return "admin/product_view";
//    }

    // Hiển thị form tạo mới sản phẩm
    @GetMapping("/product_create_form")
    public String showForm(Model model) {
        model.addAttribute("product", new Product());
        return "admin/product/product_create_form";
    }

    // Lưu sản phẩm mới
    @PostMapping("/save")
    public String save(@ModelAttribute("product") Product product, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/product_create_form";
        }
        System.out.println("Dữ liệu sản phẩm mới: " + product);
        daoProduct.save(product);
        return "redirect:/product_view";
    }

    // Hiển thị form chỉnh sửa sản phẩm
    @GetMapping("/editproduct/{productId}")
    public String edit(@PathVariable int productId, Model model) {
        Product product = daoProduct.getProductById(productId);
        model.addAttribute("product", product);
        return "admin/product/product_edit_form";
    }

    // Lưu chỉnh sửa sản phẩm
    @PostMapping("/editsave")
    public String editSave(@ModelAttribute("product") Product product, BindingResult result) {
        if (result.hasErrors()) {
            System.out.println("Có lỗi trong dữ liệu sửa sản phẩm: " + result.getAllErrors());
            return "admin/product/product_edit_form";
        }
        daoProduct.update(product);
        return "redirect:/product_view";
    }

    // Xóa sản phẩm
    @GetMapping("/deleteproduct/{productId}")
    public String delete(@PathVariable int productId) {
        daoProduct.delete(productId);
        return "redirect:/product_view";
    }
}

