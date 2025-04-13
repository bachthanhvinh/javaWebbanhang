package dao;

import java.util.List;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import beans.Product;

public class DaoProduct {
    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public List<Product> getAllProducts() {
        String sql = "SELECT * FROM product";
        return template.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
    }
}
