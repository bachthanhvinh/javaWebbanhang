package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import beans.Product;

public class DaoProduct {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Save new product
    public int save(Product p) {
        String sql = "INSERT INTO product (product_name,  price,description,  image_url,category_id) VALUES (?, ?, ?, ?, ?)";
        return template.update(sql, p.getProductName(),  p.getPrice(),p.getDescription(), p.getImageUrl(), p.getCategoryId());
    }

    // Update existing product
    public int update(Product p) {
        String sql = "UPDATE product SET product_name = ?, description = ?, price = ?, image_url = ?, category_id = ? WHERE product_id = ?";
        return template.update(sql, p.getProductName(), p.getDescription(), p.getPrice(), p.getImageUrl(), p.getCategoryId(), p.getProductId());
    }

    // Delete product
    public int delete(int productId) {
        String sql = "DELETE FROM product WHERE product_id = ?";
        return template.update(sql, productId);
    }

    // Get product by id
    public Product getProductById(int productId) {
        String sql = "SELECT * FROM product WHERE product_id = ?";
        return template.queryForObject(sql, new Object[]{productId}, new BeanPropertyRowMapper<>(Product.class));
    }

    // Get all products
    public List<Product> getProducts() {
        String sql = "SELECT * FROM product";
        return template.query(sql, new RowMapper<Product>() {
            @Override
            public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setImageUrl(rs.getString("image_url"));
                product.setCreatedAt(rs.getString("created_at")); // created_at kiểu TIMESTAMP
                product.setCategoryId(rs.getInt("category_id"));
                return product;
            }
        });
    }
}
