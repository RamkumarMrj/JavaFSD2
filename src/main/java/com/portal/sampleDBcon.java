package com.portal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class sampleDBcon {
    public List<String> show() {
        Connection con=null;
        List<String> ls = new ArrayList<String>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/world","root","root");
            String sel="select * from city";
            PreparedStatement pst=con.prepareStatement(sel);
    //        pst.setString(1,psw);
    //        int i= pst.executeUpdate();
            ResultSet rs = pst.executeQuery();
            while(rs.next()) { 
    //        	System.out.println(rs.getInt("ID"));
                ls.add(rs.getString("Name"));
                
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ls;
    }
}
