package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import beans.Category;

public class DaoCategory {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // Save new category
    public int save(Category c) {
        String sql = "INSERT INTO category (category_name) VALUES (?)";
        return template.update(sql, c.getCategoryName());
    }

    // Update existing category
    public int update(Category c) {
        String sql = "UPDATE category SET category_name = ? WHERE category_id = ?";
        return template.update(sql, c.getCategoryName(), c.getCategoryId());
    }

    // Delete category
    public int delete(int categoryId) {
        String sql = "DELETE FROM category WHERE category_id = ?";
        return template.update(sql, categoryId);
    }

    // Get category by id
    public Category getCategoryById(int categoryId) {
        String sql = "SELECT * FROM category WHERE category_id = ?";
        return template.queryForObject(sql, new Object[]{categoryId}, new BeanPropertyRowMapper<>(Category.class));
    }

    // Get all categories
    public List<Category> getCategories() {
        String sql = "SELECT * FROM category";
        return template.query(sql, new RowMapper<Category>() {
            @Override
            public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
                return category;
            }
        });
    }
}
