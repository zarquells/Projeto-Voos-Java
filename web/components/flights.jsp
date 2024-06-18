<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listagem de Voos</title>
    <link rel="stylesheet" href="style_list.css">
</head>
<body>
<%
    Connection Conexao = null;
    PreparedStatement PrepararConexao = null;
    ResultSet respostaSQL = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        String url  = "jdbc:mysql://localhost:3306/aeroporto";
        String user = "root";
        String pwd  = "";
        
        Conexao = DriverManager.getConnection(url, user, pwd);
        
        String comandoSQL = "SELECT f.pk_IDflight, ba.name_airport AS boarding_city, la.name_airport AS landing_city, ap.name_airplane " +
                            "FROM tbl_flight f " +
                            "JOIN tbl_airport ba ON f.fk_boarding_airport = ba.pk_IDairport " +
                            "JOIN tbl_airport la ON f.fk_landing_airport = la.pk_IDairport " +
                            "JOIN tbl_airplane ap ON f.fk_airplane = ap.pk_IDairplane";
        
        PrepararConexao = Conexao.prepareStatement(comandoSQL);
        respostaSQL = PrepararConexao.executeQuery();
%>

<table border="1">
    <tr>
        <th>Código de Voo</th>
        <th>Cidade de Saída</th>
        <th>Cidade de Chegada</th>
        <th>Avião</th>
    </tr>
    <% 
        while(respostaSQL.next()) {
    %>
    <tr>
        <td><%= respostaSQL.getInt("pk_IDflight") %></td>
        <td><%= respostaSQL.getString("boarding_city") %></td>
        <td><%= respostaSQL.getString("landing_city") %></td>
        <td><%= respostaSQL.getString("name_airplane") %></td>
    </tr>
    <% } %>
</table>

<%
    } catch (Exception e) {
        out.print(e);
        e.printStackTrace();
    }
%>

</body>
</html>
