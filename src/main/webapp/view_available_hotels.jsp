<html>
<head>
    <meta charset="UTF-8">
    <title>Choose your room</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Sans:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="rows">
        <form id="second-search" action="book_stay.jsp">
            <div class="row-container">

                <div class="input-block">
                    <label for="cin">Check-in</label>
                    <input type="date" id="cin" name="cin">
                </div>

                <div class="input-block">
                    <label for="cout">Check-out</label>
                    <input type="date" id="cout" name="cout">
                </div>

                <div class="input-block">
                    <label for="area">Area</label>
                    <select name="area" id="area">
                        <option value="bikinibottom">Bikini Bottom</option>
                    </select>
                </div>

                <div class="input-block">
                    <label for="capacity">Capacity</label>
                    <select name="capacity" id="capacity">
                        <option value="single">Single(1)</option>
                        <option value="double">Double(2)</option>
                        <option value="family">Family(4)</option>
                        <option value="suite">Suite</option>
                    </select>
                </div>

                <div class="input-block">
                    <label for="minprice">Min Price</label>
                    <input type="number" id="minprice" name="minprice" min="0" step="0.01" required>
                </div>

                <div class="input-block">
                    <label for="maxprice">Max Price</label>
                    <input type="number" id="maxprice" name="maxprice" min="0" step="0.01" required>
                </div>

                <button class = "button" type = "submit" form="search-hotels-form" >Search</button>

            </div>
        </form>

        <div class = "room-info-block">
            <div class="left-side">
                <h1 class="hotel-name">Hotel Name</h1>
                <div class="rating">
                    <img class="star" src="media/star.svg" alt="star">
                    <h1>3</h1>
                </div>

                <h2 class="street-address">123 Street Street</h2>
                <h2 class="room-number">Room 201</h2>


                <div class="room-info">
                   <div class="point-item">
                        <span class="bullet"></span>
                        <h3>Point</h3>
                   </div>
                   <div class="point-item">
                        <span class="bullet"></span>
                        <h3>Point</h3>
                   </div>
                   <div class="point-item">
                        <span class="bullet"></span>
                        <h3>Point</h3>
                   </div>
                </div>
            </div>
            <div class="book-now">
                <h1>$130.00</h1>
                <!-- need to change so that info is sent-->
                <a href ="book_stay.jsp">
                    <button class="button">Book now</button>
                </a>
            </div>
        </div>
    </div>
</body>
</html>
