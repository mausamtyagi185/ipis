
<!DOCTYPE html>
<html>
    <head>
        <title>Indian Railways</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/settings.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <header>
            <h1><a href="#"></a><img alt="Indian Railways"  height="100%" width="100%" src="system/assets/img/railway_logo.png"/></h1>
            <div class="header">
                <div class="headings">                    
                    <h2>Indian Railways</h2>
                    <h3>Display Device Configurations</h3>
                    <button id="logout">Logout</button>
                </div>
            </div>
        </header>
        <div id="display">
            <h4>Display settings</h4>
            <form action="getTVDisplayData" method="get">
                <label>Languages</label>
                <select>
                    <option value="1" >1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
                <label>Device ID</label>
                <input type="text" name="addr" value="" placeholder="Device Address">
                <label>Device IP</label>
                <input type="text" name="ip" value="" placeholder="IP address of device">
               
                
                <label>Pagination Timer</label>
                <input type="text" name="pagination_timer" value="" >
              
                <button>Submit</button>
            </form>
            
        </div>
       
    </body>
</html>
