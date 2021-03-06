/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.Customers;
import model.Invoice;
import model.InvoiceDetail;
import model.Shoes;
import utils.DBUtil;

/**
 *
 * @author nguye
 */
public class InvoiceManager {

    public static final String SELECT_ALL = "Select invoice.*\n"
            + " FROM invoice\n"
            + " WHERE invoice.customer_id = ?";
    public static final String INSERT_DETAIL = "Insert invoice_detail VALUES (?,?,?,?)";
    public static final String INSERT_INVOICE = "Insert invoice VALUES (?,?,?,?)";
    public static final String SELECT_ONE = "Select  s.*,invoice.*,inD.quantity,inD.size as InDSize\n"
            + " FROM invoice,shoes s, invoice_detail inD\n"
            + " WHERE  s.shoes_id = inD.shoes_id \n"
            + " AND invoice.invoice_id = inD.invoice_id \n"
            + " AND inD.invoice_id = ?"
            + " AND invoice.customer_id = ?";

    public boolean add(Invoice invoice, InvoiceDetail invoiceDetail) throws SQLException {
        Connection con = DBUtil.getConnection();
        if (con != null) {
            PreparedStatement ps = con.prepareStatement(INSERT_INVOICE);
            ps.setString(1, invoice.getInvoiceId());
            ps.setDate(2, invoice.getDate());
            ps.setFloat(3, invoice.getTotalPrice());
            ps.setInt(4, invoice.getCustomer().getCustomerId());
            int row = ps.executeUpdate();
            boolean check = false;
            for (Shoes shoe : invoiceDetail.getShoe()) {
                check = addDetail(shoe.getShoeId(), invoice.getInvoiceId(), shoe.getAmount(), shoe.getSize());
            }
            if (row > 0 && check) {
                return true;
            }
        }
        return false;
    }

    private boolean addDetail(String shoesId, String invoiceId, int quantity, int size) throws SQLException {
        Connection con = DBUtil.getConnection();
        if (con != null) {
            PreparedStatement ps = con.prepareStatement(INSERT_DETAIL);
            ps.setString(1, shoesId);
            ps.setString(2, invoiceId);
            ps.setInt(3, quantity);
            ps.setInt(4, size);
            int row = ps.executeUpdate();
            if (row > 0) {
                return true;
            }
        }
        return false;
    }

    public List<Invoice> list(int customerId) throws SQLException {
        Invoice invoice = null;
        ArrayList<Invoice> list = new ArrayList<>();
        Connection con = DBUtil.getConnection();
        if (con != null) {
            PreparedStatement ps = con.prepareStatement(SELECT_ALL);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                invoice = new Invoice();
                invoice.setInvoiceId(rs.getString("invoice_id"));
                invoice.setDate(rs.getDate("date"));
                invoice.setTotalPrice(rs.getFloat("all_total_price"));
                list.add(invoice);
            }
        }
        return list;
    }

    //not done
    public InvoiceDetail detail(String invoiceId, int customerId) throws SQLException {
        ArrayList<Shoes> list = new ArrayList<>();
        HashMap<Invoice, List> invoiceD = new HashMap<>();
        Connection con = DBUtil.getConnection();
        Shoes shoes = null;
        Invoice invoice = null;
        InvoiceDetail invoiceDetail = new InvoiceDetail();
        if (con != null) {
            PreparedStatement ps = con.prepareStatement(SELECT_ONE);
            ps.setString(1, invoiceId);
            ps.setInt(2, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                invoice = new Invoice();
                invoice.setInvoiceId(invoiceId);
                invoice.setTotalPrice(rs.getFloat("all_total_price"));
                invoice.setDate(rs.getDate("date"));
                invoice.setCustomer(new Customers(customerId));
                invoiceDetail.setInvoice(invoice);
                shoes = new Shoes();
                shoes.setShoeId(rs.getString("shoes_id"));
                shoes.setName(rs.getString("name"));
                shoes.setImg(rs.getString("img"));
                shoes.setPrice(rs.getFloat("price"));
                shoes.setCategoryId(rs.getString("category_id"));
                shoes.setSize(rs.getInt("InDSize"));
                shoes.setAmount(rs.getInt("quantity"));
                //thieu quantity voi size 
                list.add(shoes);
            }
            invoiceDetail.setShoe(list);
        }
        return invoiceDetail;
    }
}
