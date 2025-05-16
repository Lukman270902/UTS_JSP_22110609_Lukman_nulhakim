<%@ page import="java.util.*, model.Film" %>
<%
    List<Film> daftarFilm = new ArrayList<>();
    daftarFilm.add(new Film("Avengers", "Action", 150, 50000, new String[]{"12:00", "15:00", "18:00"}));
    daftarFilm.add(new Film("Frozen", "Animation", 110, 30000, new String[]{"10:00", "13:00", "16:00"}));
    daftarFilm.add(new Film("Naruto", "Animation", 120, 20000, new String[]{"11:00", "14:00", "17:00"}));
    daftarFilm.add(new Film("Spongbob", "Animation", 130, 70000, new String[]{"13:00", "16:00", "18:00"}));
    daftarFilm.add(new Film("Doraemon", "Animation", 140, 90000, new String[]{"14:00", "13:00", "22:00"}));
    daftarFilm.add(new Film("Ganteng ganteng serigala", "Sinetron", 160, 40000, new String[]{"10:00", "13:00", "16:00"}));
    session.setAttribute("daftarFilm", daftarFilm);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Daftar Film</title>
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
            text-align: center;
            margin-bottom: 30px;
        }

        .card {
            background-color: #5c4438;
            border: none;
            border-radius: 15px;
            padding: 1.5rem;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.3);
            background-color: #6b4f3c;
        }

        .card-title {
            color: #ffe0b3;
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .card-text {
            font-size: 1rem;
            color: #f5f0e6;
            margin-bottom: 0.3rem;
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

        .container {
            max-width: 900px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Daftar Film</h2>
        <div class="row g-4">
            <%
                for(Film f : daftarFilm){
            %>
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title"><%= f.getJudul() %></div>
                        <p class="card-text"><strong>Genre:</strong> <%= f.getGenre() %></p>
                        <p class="card-text"><strong>Durasi:</strong> <%= f.getDurasi() %> menit</p>
                        <p class="card-text"><strong>Harga Tiket:</strong> Rp <%= f.getHargaTiket() %></p>
                        <p class="card-text"><strong>Jam Tayang:</strong> <%= String.join(", ", f.getJamTayang()) %></p>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

        <div class="text-center">
            <a href="formPesan.jsp" class="btn btn-brown mt-5">Pesan Tiket</a>
        </div>
    </div>
</body>
</html>
