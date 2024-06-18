<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
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
            Connection Conexao;
            PreparedStatement PrepararConexao;
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String url  = "jdbc:mysql://localhost:3306/aeroporto";
            String user = "root";
            String pwd  = "";
            
            Conexao = DriverManager.getConnection(url, user, pwd);
            
            String comandoSQL     =("SELECT (pk_IDflight, fk_boarding_airport, fk_landing_airport, fk_airplane) FROM tbl_flight");
            PrepararConexao       = Conexao.prepareStatement(comandoSQL);
            ResultSet respostaSQL = PrepararConexao.executeQuery();
            
        %>
        
        <table border="1";>
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
                <td><%=respostaSQL.getString("Código de Voo")%></td>
            
                <td><%=respostaSQL.getString("Cidade de Saída")%></td>

                <td><%=respostaSQL.getString("Cidade de Chegada")%></td>

                <td><%=respostaSQL.getString("Avião")%></td>
            </tr>
            
            <%
                }
            %>
        </table>              

    </body>
</html>
