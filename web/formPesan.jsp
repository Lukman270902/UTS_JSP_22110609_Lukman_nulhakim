<%@ page import="java.util.*, model.Film" %>
<%
    List<Film> daftarFilm = (List<Film>) session.getAttribute("daftarFilm");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Form Pemesanan Tiket</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #3e2f2f;
            color: #f5f0e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        h2 {
            color: #ffe0b3;
            margin-bottom: 30px;
            text-align: center;
        }

        .form-container {
            background-color: #5c4438;
            padding: 40px;
            border-radius: 15px;
            max-width: 600px;
            margin: 60px auto;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }

        label {
            color: #ffe0b3;
            font-weight: bold;
        }

        .form-control,
        .form-select {
            background-color: #f5f0e6;
            color: #3e2f2f;
            border: 1px solid #a07e63;
            border-radius: 10px;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #8b5e3c;
            box-shadow: 0 0 0 0.2rem rgba(139, 94, 60, 0.25);
        }

        .btn-brown {
            background-color: #8b5e3c;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 1.1rem;
            font-weight: bold;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }

        .btn-brown:hover {
            background-color: #a76f4d;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2>Form Pemesanan Tiket</h2>
            <form action="struk.jsp" method="post">
                <div class="mb-3">
                    <label for="nama" class="form-label">Nama Pemesan</label>
                    <input type="text" class="form-control" id="nama" name="nama" required>
                </div>
                <div class="mb-3">
                    <label for="jumlah" class="form-label">Jumlah Tiket</label>
                    <input type="number" class="form-control" id="jumlah" name="jumlah" required min="1">
                </div>
                <div class="mb-3">
                    <label for="film" class="form-label">Pilih Film</label>
                    <select class="form-select" id="film" name="film" required>
                        <% for (Film f : daftarFilm) { %>
                            <option value="<%= f.getJudul() %>"><%= f.getJudul() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="jam" class="form-label">Pilih Jam</label>
                    <select class="form-select" id="jam" name="jam" required>
                        <% for (String jam : daftarFilm.get(0).getJamTayang()) { %>
                            <option value="<%= jam %>"><%= jam %></option>
                        <% } %>
                    </select>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-brown">Pesan</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
