package dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DaoProduct {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Lấy tất cả sản phẩm
    public List<Product> getAllProducts() {
        String sql = "SELECT * FROM product";
        return jdbcTemplate.query(sql, productRowMapper);
    }

    // Lấy sản phẩm theo ID
    public Product getProductById(int productId) {
        String sql = "SELECT * FROM product WHERE product_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{productId}, productRowMapper);
    }

    // Thêm sản phẩm mới
    public int addProduct(Product product) {
        String sql = "INSERT INTO product (product_name, description, price, stock_quantity, image_url) VALUES (?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, product.getProductName(), product.getDescription(), product.getPrice(), product.getStockQuantity(), product.getImageUrl());
    }

    // Cập nhật thông tin sản phẩm
    public int updateProduct(Product product) {
        String sql = "UPDATE product SET product_name = ?, description = ?, price = ?, stock_quantity = ?, image_url = ? WHERE product_id = ?";
        return jdbcTemplate.update(sql, product.getProductName(), product.getDescription(), product.getPrice(), product.getStockQuantity(), product.getImageUrl(), product.getProductId());
    }

    // Xóa sản phẩm
    public int deleteProduct(int productId) {
        String sql = "DELETE FROM product WHERE product_id = ?";
        return jdbcTemplate.update(sql, productId);
    }

    // Định nghĩa RowMapper để chuyển đổi kết quả từ ResultSet thành đối tượng Product
    private RowMapper<Product> productRowMapper = (rs, rowNum) -> {
        Product product = new Product();
        product.setProductId(rs.getInt("product_id"));
        product.setProductName(rs.getString("product_name"));
        product.setDescription(rs.getString("description"));
        product.setPrice(rs.getBigDecimal("price"));
        product.setStockQuantity(rs.getInt("stock_quantity"));
        product.setImageUrl(rs.getString("image_url"));
        return product;
    };
}
