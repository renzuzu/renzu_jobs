        var jobdata = {}
        var myjob = undefined
        let weapondata = {}
        let wardrobe = {}
        let ownedvehicles = {}
        let craftables = {}
        let imglink = ''

        function formatsecond(s) {
          var timestamp = s;
          var hours = Math.floor(timestamp / 60 / 60);
          var minutes = Math.floor(timestamp / 60) - (hours * 60);
          var seconds = timestamp % 60;
          var formatted = hours.toString().padStart(2, '0') + ':' + minutes.toString().padStart(2, '0') + ':' + seconds.toString().padStart(2, '0');
          return formatted
        }
        
        function CreateVehicleShop(vehicleshop) {
          $("#vehicelshopmain").html('')
          
          for (const i in vehicleshop) {
            
            var kick = `<i style="color:white; font-size:30px;float:right;" id="vehicleshop" onclick="OpenModalFunction(this,'`+vehicleshop[i].name+`','`+vehicleshop[i].label+`','`+vehicleshop[i].image+`')" class="fas fa-shopping-cart"></i>`
            $("#vehicleshopmain").prepend(`<article class="leaderboard__profile" id="`+vehicleshop[i].name+`">
            <img style="    border-radius: 5%;
            background: #080808;
            width: 90px;" src="`+vehicleshop[i].image+`" alt="`+vehicleshop[i].name+`" class="leaderboard__picture">
            <span class="leaderboard__name" style="margin-top:20px;
            height: 50px;">`+vehicleshop[i].label+` - <span style="color:lime;"> $`+vehicleshop[i].value+` <span style="color: white;
            position: absolute;
            top: 20%;
            left: 8vw;
            font-size: 12px;"> Class: <span style="color:skyblue;">`+vehicleshop[i].class+`</span> </span></span>
            <span class="leaderboard__value">`+kick+`<span>
            </article>`);
          }
        }

        function CreateCrafting(craft,img,jobinventory) {
          $("#craftingmain").html('')
          
          for (const i in craft) {
            var owned = 'green'
            craftables[craft[i].name] = craft[i].requirements
            var kick = `<i style="color:white; font-size:30px;" id="craft" onclick="OpenModalFunction(this,'`+craft[i].name+`','`+craft[i].label+`','`+craft[i].type+`')" class="fad fa-tools"></i>`
            //
            $("#craftingmain").prepend(`<article class="leaderboard__profile" id="`+craft[i].name.replace(":", "")+`">
            <img style="    border-radius: 5%;
            background: #080808;
            width: 60px;" src="`+img+``+craft[i].name+`.png" onerror="this.src='https://raw.githubusercontent.com/renzuzu/carmap/main/carmap/items/`+craft[i].name+`.png';this.onerror='defaultimg()'" alt="`+craft[i].name+`" class="leaderboard__picture">

            <span onclick="openprofile()" class="leaderboard__name" style="margin-top:20px;
            height: 50px;">`+craft[i].label+` - <i class="fas fa-clock"></i> <span style="color:lime;">`+formatsecond(craft[i].seconds)+`</span></span>
            
            </span>
                      <span class="leaderboard__value">`+kick+`<span></span></span>
            </article>`);
          }
        }

        function CreateClothes(clothes,img,jobinventory) {
          $("#clothemain").html('')
          
          var icon = {}
          icon['T-Shirt 1'] = 'fas fa-tshirt'
          icon['T-Shirt 2'] = 'fad fa-tshirt'
          icon['Torso 1'] = 'fas fa-user-tie'
          icon['Torso 2'] = 'fad fa-user-tie'
          icon['Decals 1'] = 'fas fa-badge-sheriff'
          icon['Decals 2'] = 'fad fa-badge-sheriff'
          icon['Arms'] = 'fas fa-hand-spock'
          icon['Pants 1'] = `<svg class="leaderboard__picture" style="    border-radius: 5%;
          background: #080808;
          width: 60px;     font-size: 50px;
          color: #fff;" viewBox="-120 0 448 448"
          xmlns="http://www.w3.org/2000/svg">
          <path fill="#ffffff" stroke="grey" d="m0 448h72.59375l23.40625-304.617188c.324219-4.164062 3.796875-7.378906 7.976562-7.378906 4.175782 0 7.652344 3.214844 7.976563 7.378906l23.453125 304.617188h72.59375v-368.640625c-24.527344-3.566406-43.792969-22.832031-47.359375-47.359375h-16.640625v40c0 13.253906-10.746094 24-24 24h-16c-4.417969 0-8-3.582031-8-8v-56h-48.640625c-3.566406 24.527344-22.832031 43.792969-47.359375 47.359375zm0 0"/>
          <path d="m0 0h96v16h-96zm0 0"/>
          <path d="m0 63.199219c15.699219-3.234375 27.964844-15.5 31.199219-31.199219h-31.199219zm0 0"/>
          <path d="m144 0h64v16h-64zm0 0"/>
          <path d="m208 32h-31.199219c3.234375 15.699219 15.5 27.964844 31.199219 31.199219zm0 0"/>
          <path d="m112 0h16v16h-16zm0 0"/>
          <path d="m128 72v-40h-16v48h8c4.417969 0 8-3.582031 8-8zm0 0"/>
        </svg>`
          icon['Pants 2'] = `<svg class="leaderboard__picture" style="    border-radius: 5%;
          background: #080808;
          width: 60px;     font-size: 50px;
          color: #fff;" viewBox="-120 0 448 448"
          xmlns="http://www.w3.org/2000/svg">
          <path fill="#ffffff" stroke="grey" d="m0 448h72.59375l23.40625-304.617188c.324219-4.164062 3.796875-7.378906 7.976562-7.378906 4.175782 0 7.652344 3.214844 7.976563 7.378906l23.453125 304.617188h72.59375v-368.640625c-24.527344-3.566406-43.792969-22.832031-47.359375-47.359375h-16.640625v40c0 13.253906-10.746094 24-24 24h-16c-4.417969 0-8-3.582031-8-8v-56h-48.640625c-3.566406 24.527344-22.832031 43.792969-47.359375 47.359375zm0 0"/>
          <path d="m0 0h96v16h-96zm0 0"/>
          <path d="m0 63.199219c15.699219-3.234375 27.964844-15.5 31.199219-31.199219h-31.199219zm0 0"/>
          <path d="m144 0h64v16h-64zm0 0"/>
          <path d="m208 32h-31.199219c3.234375 15.699219 15.5 27.964844 31.199219 31.199219zm0 0"/>
          <path d="m112 0h16v16h-16zm0 0"/>
          <path d="m128 72v-40h-16v48h8c4.417969 0 8-3.582031 8-8zm0 0"/>
        </svg>`
          icon['Shoes 1'] = 'fas fa-boot'
          icon['Shoes 2'] = 'fad fa-boot'
          icon['Chain 1'] = 'fas fa-scarf'
          icon['Chain 2'] = 'fad fa-scarf'
          icon['Helmet 1'] = 'fas fa-hard-hat'
          icon['Helmet 2'] = 'fad fa-hard-hat'
          icon['Glasses 1'] = 'fas fa-glasses'
          icon['Glasses 2'] = 'fad fa-glasses'
          icon['Bag'] = 'fas fa-backpack'
          icon['Bag color'] = 'fad fa-backpack'
          for (const i in clothes) {

            var owned = 'green'
            if (!clothes[i].owned) {
              owned = 'red'
            }
            var kick = `<i style="color:white; font-size:30px;right: 1vw;
            position: absolute;
            top: 2.5vw;" id="modify_weapon" onclick="nav(this,'`+clothes[i].name+`_id',true)" class="fad fa-chevron-square-right"></i>`
            //
            var ico = `<i style="    border-radius: 5%;
            background: #080808;
            width: 60px;     font-size: 50px;
            color: #fff;" class="`+icon[clothes[i].label]+` leaderboard__picture"></i>`
            if (clothes[i].label == 'Pants 1' || clothes[i].label == 'Pants 2') {
              ico = icon[clothes[i].label]
            }
            $("#clothemain").append(`<article class="leaderboard__profile" id="`+clothes[i].name.replace(":", "")+`">
            `+ico+`

            <span class="leaderboard__name" style="margin-top:20px;
            height: 50px;">`+clothes[i].label+`</span>
            <input class="slider__input" id="`+clothes[i].name+`_id" type="range" value="`+clothes[i].value+`" max="`+clothes[i].max+`" style="position: absolute;
            top: 65%;
            left: 19%;
            width: 57%;">
              <div id="h4-container"><div id="h4-subcontainer"><h4>0<span></span></h4></div></div>

            <span id="deposit_item" onclick="nav(this,'`+clothes[i].name+`_id')" class="leaderboard__value" style="
            position: absolute;
            right: 4vw;
            top: 2.5vw;
            "><i class="fad fa-chevron-square-left" style="font-size:30px;color:white;"></i><span></span>
            
            </span>
                      <span class="leaderboard__value">`+kick+`<span></span></span>
            </article>`);

          }
          const sliderInput = document.querySelectorAll('.slider__input');
          for (var i = 0; sliderInput.length > i; i++) {
            sliderInput[i].addEventListener('input', function () {
              const valueContainer = this.parentNode.parentNode.querySelector('.slider__value');
              const sliderValue = this.value;
              const maxVal = this.getAttribute('max');
              
              $.post("https://renzu_jobs/changeclothes",JSON.stringify({name:this.id,value:sliderValue}),function(cb) {
                if (cb) {}
              });
            });
          }
        }

        function CreateWeapons(weapons,img,jobinventory) {
          $("#weaponmain").html('')
          
          for (const i in weapons) {

            var owned = 'green'
            if (!weapons[i].owned) {
              owned = 'red'
            }
            var kick = `<i style="color:white; font-size:30px;" id="modify_weapon" onclick="OpenModalFunction(this,'`+weapons[i].name+`')" class="fad fa-arrow-alt-square-up"></i>`
            //
            $("#weaponmain").prepend(`<article class="leaderboard__profile" id="`+weapons[i].name.replace(":", "")+`">
            <img style="    border-radius: 5%;
            background: #080808;
            width: 60px;" src="`+img+``+weapons[i].name+`.png" onerror="this.src='https://raw.githubusercontent.com/renzuzu/carmap/main/carmap/items/`+weapons[i].name+`.png';this.onerror='defaultimg()'" alt="`+weapons[i].name+`" class="leaderboard__picture">

            <span class="leaderboard__name" style="margin-top:20px;
            height: 50px;">`+weapons[i].label+`</span>

            <span id="deposit_item" onclick="getweapon(this,'`+weapons[i].name+`')" class="leaderboard__value" style="
            position: absolute;
            right: 4vw;
            "><i class="fab fa-get-pocket" style="font-size:30px;color:`+owned+`;"></i><span></span>
            
            </span>
                      <span class="leaderboard__value">`+kick+`<span></span></span>
            </article>`);

          }
        }

        function CreateShop(shop,img,jobinventory) {
          $("#shopmain").html('')
          
          for (const i in shop) {
            
            var owned = 'green'
            var kick = `<i style="color:white; font-size:30px;" id="buy" onclick="OpenModalFunction(this,'`+shop[i].name+`','`+shop[i].label+`')" class="fad fa-shopping-cart"></i>`
            //
            if (shop[i].value == false) {
              shop[i].value = 'FREE'
            }
            $("#shopmain").prepend(`<article class="leaderboard__profile" id="`+shop[i].name.replace(":", "")+`">
            <img style="    border-radius: 5%;
            background: #080808;
            width: 60px;" src="`+img+``+shop[i].name+`.png" onerror="this.src='https://raw.githubusercontent.com/renzuzu/carmap/main/carmap/items/`+shop[i].name+`.png';this.onerror='defaultimg()'" alt="`+shop[i].name+`" class="leaderboard__picture">
            <span class="leaderboard__name" style="margin-top:20px;
            height: 50px;">`+shop[i].label+` - <span style="color:lime;">$ `+shop[i].value+` </span></span>
            <span class="leaderboard__value">`+kick+`<span>
            </article>`);
          }
        }

        function CreateGarage(garage,img,jobinventory) {
          $("#garagemain").html('')
          
          for (const i in garage) {
            
            var stored = 'green'
            if (garage[i].stored == 0) {
              stored = 'red'
            }
            ownedvehicles[garage[i].plate] = garage[i]
            var kick = `<i style="color:`+stored+`; font-size:30px;" id="garage" onclick="OpenModalFunction(this,'`+garage[i].plate+`','`+garage[i].label+`')" class="fad fa-car"></i>`
            if (stored == 'green') {
              kick = `<i style="color:`+stored+`; font-size:30px;" id="garage" onclick="spawnvehicle(this,'`+garage[i].plate+`','`+garage[i].label+`')" class="fad fa-car"></i>`
            }
            $("#garagemain").prepend(`<article class="leaderboard__profile" id="`+garage[i].plate+`">
            <img style="    border-radius: 5%;
            background: #080808;
            width: 90px;" src="`+garage[i].image+`" alt="`+garage[i].plate+`" class="leaderboard__picture">
            <span class="leaderboard__name" style="margin-top:20px;
            height: 50px;">`+garage[i].label+` <span style="color: white;
            position: absolute;
            top: 10%;
            left: 65%;
            font-size: 12px;"> Class: <span style="color:skyblue;">`+garage[i].class+`</span></span>
            <span style="    color: white;
            position: absolute;
            top: 10%;
            left: 32%;
            font-size: 12px;"> Plate: <span style="color:lime;">`+garage[i].plate+`</span> </span></span>
            <span class="leaderboard__value">`+kick+`<span>
            </article>`);
          }
        }

        function CreateInventory(inventory,img,jobinventory) {
          $("#tab1").html('')
          $("#tab2").html('')
          
          for (const i in inventory) {

            var kick = `<i style="color:red;" id="kick" onclick="OpenModalFunction(this,'`+inventory[i].name+`')" class="fad fa-user-times"></i>`
            
            $("#tab1").prepend(`<article class="leaderboard__profile" id="`+i+`">
            <img style="    border-radius: 5%;
            background: #080808;
            width: 60px;" src="`+img+``+inventory[i].name+`.png" onerror="this.src='https://raw.githubusercontent.com/renzuzu/carmap/main/carmap/items/`+inventory[i].name+`.png';this.onerror='defaultimg()'" alt="`+inventory[i].name+`" class="leaderboard__picture">

            <span class="leaderboard__name" style="margin-top:20px;
            height: 50px; width:80px;">`+inventory[i].label+`</span>

            <span id="deposit_item" onclick="OpenModalFunction(this,'`+inventory[i].name+`')" class="leaderboard__value" style="
            position: absolute;
            right: 1.2vw;
            "><i class="fab fa-get-pocket" style="font-size:20px;"></i><span></span>
            
            </span>
                      </span></span>
            </article>`);

          }
          var itemslot = {}
          for (const i in jobinventory) {
            if (itemslot[i] == undefined) {
              
              itemslot[i] = true

            var kick = `<i style="color:red;" id="kick" onclick="OpenModalFunction(this,'`+jobinventory[i].name+`')" class="fad fa-user-times"></i>`
            //
            $("#tab2").prepend(`<article class="leaderboard__profile" id="`+i+`">
            <img style="    border-radius: 5%;
            background: #080808;
            width: 60px;" src="`+img+``+jobinventory[i].name+`.png" onerror="this.src='https://raw.githubusercontent.com/renzuzu/carmap/main/carmap/items/`+jobinventory[i].name+`.png';this.onerror='defaultimg()'" alt="`+jobinventory[i].name+`" class="leaderboard__picture">

            <span class="leaderboard__name" style="margin-top:20px;
            height: 50px; width:80px;">`+jobinventory[i].label+`</span>

            <span id="withdraw_item" onclick="OpenModalFunction(this,'`+jobinventory[i].name+`')" class="leaderboard__value" style="
            position: absolute;
            right: 1.2vw;
            "><i class="fab fa-get-pocket" style="font-size:20px;"></i><span></span>
            
            </span>
                      </span></span>
            </article>`);

            }
          }
        }

        function Addplayers(table,identity) {
            for (const i in table.players) {
              
              if (table.players[i].id) {
                if (table.players[i].firstname !== undefined) {
                  table.players[i].name = ''+table.players[i].firstname+' '+table.players[i].lastname+''
                }
                var jobdiv = `<span class="leaderboard__name" style="float: left;
                position: absolute;
                left: 50px;
                font-weight: 500;
                font-size: 11px;
                top: 10px;"><i class="fad fa-user-tie"></i> `+capitalizeFirstLetter(table.players[i].job)+`</span>`
                kick = `<i style="color:red;" id="kick" onclick="OpenModalFunction(this,'`+table.players[i].id+`')" class="fad fa-user-times"></i>`
                var divid = `<span class="leaderboard__name" style="float: left;position: absolute;left: -1.5vw;bottom: 0%;font-weight: 700;font-size: 14px;width: auto;min-width: 55px;background: #0808087d;border-radius: 5px;color: #daebf5;"><i class="fad fa-id-card"></i> `+table.players[i].id+`</span>`

                //
                $("#jobmain").prepend(`<article class="leaderboard__profile" id="`+table.players[i].id.replace(":", "")+`">
                <img src="`+table.players[i].image+`" alt="`+table.players[i].name+`" class="leaderboard__picture">
                <span class="leaderboard__name" style="margin-top:20px;width: 300px;
                height: 50px;">`+table.players[i].name+`</span>
                `+jobdiv+`
                <span id="give" onclick="OpenModalFunction(this,'`+table.players[i].id+`')" class="leaderboard__value" style="
      position: absolute;
      right: 5vw;
  "><i class="fad fa-hands-usd"></i><span></span></span>
                <span id="grade" onclick="OpenModalFunction(this,'`+table.players[i].id+`','`+table.players[i].job+`')" class="leaderboard__value" style="
      position: absolute;
      right: 3vw;
  "><i class="fad fa-chart-line"></i><span></span></span>
                <span class="leaderboard__value" style="position: absolute;
                right: 1vw;">`+kick+`<span></span></span>
                </article>`);

              }
            }

        }

        var on_switch = "selected";
        var off_switch = "not_selected";
        var offduty = true
        function duty(state,originaljob) {
          if (state == true && offduty !== state) {
            offduty = state
            var temp = on_switch
            on_switch = off_switch
            off_switch = temp;
            $("#switch_on").attr('class', on_switch);
            $("#switch_off").attr('class', off_switch);
            $.post("https://renzu_jobs/duty",JSON.stringify({job:originaljob,state:state}),function(cb) {
              if (cb) {
                //$('#modalfunc').html('')
              }
            });
            return
          } 
          if (state == false && offduty !== state) {
            offduty = state
            var temp = on_switch
            on_switch = off_switch
            off_switch = temp;
            $("#switch_on").attr('class', on_switch);
            $("#switch_off").attr('class', off_switch);
            $.post("https://renzu_jobs/duty",JSON.stringify({job:originaljob,state:state}),function(cb) {
              if (cb) {
                //$('#modalfunc').html('')
              }
            });
            return
          }
        }

        function OpenModalFunction(e,id,label,type) {
          if (e.id == 'duty') {
            var dutystr = `<div id="duty" class="modal" style="display: block;left: 15%;
            top: 15%;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal(true)">×</span>
                <h2 style="text-align:center;">Doty On/Off - Job: `+type+`<span id="playername"></span></h2>
              </div>
              <div class="modal-body" style="    margin: 10px;
              text-align: center;">

              <div class="containerd" style="margin: 20px;width: 90%;">
              <div class="flex" style="background: #21222387;padding: 20px;">
              <a id="switch_on" class="selected" onclick="duty(true,'`+type+`')" style="padding: 10px;
              background: #bf002c;margin: 5px;">ON</a>
              <a id="switch_off" class="not_selected" onclick="duty(false,'`+type+`')" style="padding: 10px;
              background: #bf002c;margin: 5px;">OFF</a>
              </div>
              </div>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(dutystr)
          }
          if (e.id == 'vehicleshop') {
            var vehicleshop = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Buy Vehicle - `+label+`<span id="playername"></span></h2>
              </div>
              <div class="modal-body" style="    margin: 10px;
              text-align: center;">
              <img style="
            border-radius: 5%;
            background: #080808;
            width: 150px;
            margin-bottom: 10px;
            " src="`+type+`" onerror="this.src='`+type+`';this.onerror='defaultimg()'" alt="weapon" class="leaderboard__picture">

                <form id="manage" method="post" style="padding: 5px;
                padding-top: 20px;">
                  <button style="position:unset !important; width:60%; margin-bottom:20px;" id="buyvehiclef" onclick="event.preventDefault();buyvehicle('`+id+`')">Confirm</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(vehicleshop)
          }
          if (e.id == 'craft') {
            var craft = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Craft Item `+label+`<span id="playername"></span></h2>
              </div>
              <div class="modal-body" style="    margin: 10px;
              text-align: center;">
              <img style="
            border-radius: 5%;
            background: #080808;
            width: 150px;
            margin-bottom: 10px;
            " src="`+imglink+``+id+`.png" onerror="this.src='https://raw.githubusercontent.com/renzuzu/carmap/main/carmap/items/`+id+`.png';this.onerror='defaultimg()'" alt="weapon" class="leaderboard__picture">
            <h2 style="text-align:center;padding-top: 0;margin-top: 0;margin-bottom: 0;font-size: 17px;">Required for `+label+`<span id="playername"></span></h2>
            <div class="list-wrapper">
              <ul class="list" id="requirements">
              </ul>
            </div>
                <form id="manage" method="post" style="padding: 5px;
                padding-top: 20px;">
                <label for="url" style="display: inline;
                background: #011a40;
                margin-right: 5px;
                height: 40px;
                padding-top: 11px;
                padding-bottom: 10px;">Amount:</label>
                  <input type="text" id="amount" name="amount" style="    margin-bottom: 10px;">
                  <button style="position:unset !important;" id="craftitem" onclick="event.preventDefault();craft('`+id+`','`+type+`')">Confirm</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(craft)
            for (const i in craftables[id]) {
              
              var kick = `<i style="color:white; font-size:30px;" class="fad fa-check"></i>`
              var string = `
              <li class="list-item">
                <div class="list-item__image">
                    <img style="
                    border-radius: 5%;
                    background: #080808;
                    width: 30px;
                    height:30px;
                    " src="`+imglink+``+craftables[id][i].name+`.png" onerror="this.src='https://raw.githubusercontent.com/renzuzu/carmap/main/carmap/items/`+craftables[id][i].name+`.png';this.onerror='defaultimg()'" class="leaderboard__picture" alt="Thumbnail">
                </div>
                <div class="list-item__content">
                    <h4 style="color:white;">  `+craftables[id][i].name+`  <span style="color:grey;font-weight:500;">x`+craftables[id][i].amount+`</span> </h4>
                    <p> </p>
                </div>
            </li>`
              $('#requirements').append(string)
            }
          }
          if (e.id == 'buy') {
            var give = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Buy Item `+label+`<span id="playername"></span></h2>
              </div>
              <div class="modal-body">
                <form id="manage" method="post">
                <label for="url" style="display: inline;
                background: #011a40;
                margin-right: 5px;
                height: 40px;
                padding-top: 11px;
                padding-bottom: 10px;">Amount:</label>
                  <input type="text" id="amount" name="amount">
                  <button style="position:unset !important;" id="buyitem" onclick="event.preventDefault();buy('`+id+`')">Confirm</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(give)
          }
          
          if (e.id == 'modify_weapon') {
            var give = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:50%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Modify Weapon `+id+`<span id="playername"></span></h2>
              </div>
              <div class="modal-body" style="    margin: 5vh;
              text-align: center;">
              <img style="
            border-radius: 5%;
            background: #080808;
            width: 150px;
            margin-bottom: 40px;
            " src="`+imglink+``+id+`.png" onerror="this.src='https://raw.githubusercontent.com/renzuzu/carmap/main/carmap/items/`+id+`.png';this.onerror='defaultimg()'" alt="weapon" class="leaderboard__picture">
                <form name="weaponcomponents" id="weaponcomponents" style="    width: 95%;
                background: #1e1e1f21;
                height: 40vh;
                overflow: scroll;">

                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(give)
            let installed = {}
            $('#weaponcomponents').html('')
            for (const i in weapondata) {
              if (weapondata[i].name == id) {
                for (const c in weapondata[i].install_components) {
                  if (weapondata[i].install_components[c]) {
                    installed[c] = true
                    
                  }
                }
                for (const a in weapondata[i].components) {
                  var component = `<div class="option" style="width:100%;background: #0000003b;
                  margin-top: 5px;
                  color: #bbe6ff;
                  font-family: 'Font Awesome 5 Free';border-radius:5px">
                  <input type="radio" name="index" id="`+weapondata[i].components[a].name+`" value="`+weapondata[i].components[a].name+`">
                  <label for="`+weapondata[i].components[a].name+`" aria-label="`+weapondata[i].components[a].name+`" style="width:90%;">
                  <span style="border: none;
                  background: none;"><i id="`+weapondata[i].components[a].name+`_check" class="fas fa-square" style="font-size:30px; color:grey;"></i></span>

                  `+weapondata[i].components[a].label+`

                  <div class="job job--white job--sm" style="background-image: url(`+imglink+``+weapondata[i].components[a].name+`.png);
                  background-size: 100% 100%;
                  background-repeat: no-repeat;">
                  </div>
                  </label>
                  </div>`
                  $('#weaponcomponents').prepend(component)
                }
              }
            }
            var rad = document.weaponcomponents.index;
            var prev = null;
            let checked = {}
            for(var i = 0; i < rad.length; i++) {
              
              checked[rad[i].id] = installed[rad[i].id]
              if (checked[rad[i].id]) {
                
                $("#"+rad[i].id+"_check").toggleClass('fa-check-square')
              }
              rad[i].onclick = function () {
                //(prev)? 
                if(this !== prev) {
                    prev = this;
                }
                checked[this.value] = !checked[this.value]
                if (!checked[this.value]) {
                  installed[this.value] = checked[this.value]
                  for (const i in weapondata) {
                    if (weapondata[i].name == id) {
                      for (const c in weapondata[i].install_components) {
                        
                        if (c == this.value && weapondata[i].install_components[c]) {
                          installed[c] = false
                          weapondata[i].install_components[c] = false
                          
                        }
                      }
                      for (const c in weapondata[i].install_components) {
                        
                      }
                    }
                  }
                } else {
                  installed[this.value] = checked[this.value]
                  for (const i in weapondata) {
                    if (weapondata[i].name == id) {
                      weapondata[i].install_components[this.value] = true
                      for (const c in weapondata[i].install_components) {
                        
                      }
                    }
                  }
                }
                var classn = 'fa-check-square'
                if (checked[this.value]) {
                  classn = 'fa-check-square'
                } else {
                  classn = 'fa-square'
                }
                $("#"+this.value+"_check").toggleClass(classn)
                //document.getElementById(""+this.value+"_check").style.color = 'green'
                
                $.post("https://renzu_jobs/setcomponents",JSON.stringify({component:this.value,weapon:id}),function(cb){
                  if (cb) {
                    
                  }
                });
              };
            }
          }

          if (e.id == 'load_clothe') {
            var give = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:50%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Select Clothing form Wardrobe <span id="playername"></span></h2>
              </div>
              <div class="modal-body" style="    margin: 2vw;
              text-align: center;">
                <form name="clothing" id="clothing" style="width: 95%;
                background: #1e1e1f21;height: 350px;
                overflow: scroll;">

                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(give)
            let installed = {}
            $('#clothing').html('')
            for (const i in wardrobe) {
              if (wardrobe[i]) {
                var cloth = `<div class="option" style="width:100%;background: #0000003b;
                margin-top: 5px;
                color: #bbe6ff;
                font-family: 'Font Awesome 5 Free';border-radius:5px">
                <input type="radio" name="index" id="`+i+`" value="`+i+`">
                <label for="`+i+`" aria-label="`+i+`" style="width:90%;">
                <span style="border: none;
                background: none;"><i id="`+i+`_check" class="fas fa-tshirt" style="font-size:30px; color:grey;"></i></span>

                `+i+`

                <div class="job job--white job--sm" style="background-image: url(`+imglink+``+i+`.png);
                background-size: 100% 100%;
                background-repeat: no-repeat;">
                </div>
                </label>
                </div>`
                $('#clothing').prepend(cloth)
              }
            }
            var rad = document.clothing.index;
            var prev = null;
            for(var i = 0; i < rad.length; i++) {
              rad[i].onclick = function () {
                //(prev)? 
                if(this !== prev) {
                    prev = this;
                }
                
                $.post("https://renzu_jobs/selectclothes",JSON.stringify({name:this.value}),function(cb) {
                  if (cb) {
                    
                  }
                });
              };
            }
          }
          
          if (e.id == 'save_clothe') {
            var give = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Save Clothing <span id="playername"></span></h2>
              </div>
              <div class="modal-body">
                <form id="manage" method="post">
                <input type="hidden" id="save_to" name="save_to" value="Create New">
                  <div class="select" id="clotheselect">
                    <select class="control control--select" id="saveto" onchange="SaveF()">
                      <option selected="selected" value="new">Create New</option>
                    </select>
                  </div>
                <label id="clothelabel" for="url" style="display: inline;
                background: #011a40;
                margin-right: 5px;
                height: 40px;
                padding-top: 11px;
                padding-bottom: 10px;">Name:</label>
                  <input type="text" id="savenew" name="savenew">
                  <button style="position:unset !important;" id="saveclothes" onclick="event.preventDefault();Saveclothes('`+id+`')">Confirm</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(give)
            for (const i in wardrobe) {
              
              $('#saveto').append('<option value="'+i+'">'+i+'</option>')
              //<option value="sample">SAMPLE</option>
            }
          }
          if (e.id == 'deposit_item') {
            var give = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Deposit Item `+id+`<span id="playername"></span></h2>
              </div>
              <div class="modal-body">
                <form id="manage" method="post">
                <label for="url" style="display: inline;
                background: #011a40;
                margin-right: 5px;
                height: 40px;
                padding-top: 11px;
                padding-bottom: 10px;">Amount:</label>
                  <input type="text" id="amount" name="amount">
                  <button style="position:unset !important;" id="sendbonus" onclick="event.preventDefault();itemfunc(1,'`+id+`')">Confirm</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(give)
          }
          if (e.id == 'withdraw_item') {
            var give = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Withdraw Item `+id+`<span id="playername"></span></h2>
              </div>
              <div class="modal-body">
                <form id="manage" method="post">
                <label for="url" style="display: inline;
                background: #011a40;
                margin-right: 5px;
                height: 40px;
                padding-top: 11px;
                padding-bottom: 10px;">Amount:</label>
                  <input type="text" id="amount" name="amount">
                  <button style="position:unset !important;" id="sendbonus" onclick="event.preventDefault();itemfunc(0,'`+id+`')">Confirm</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(give)
          }
          if (e.id == 'kick') {
            //fireplayer('`+table.players[i].id+`','`+i.replace(/[^a-zA-Z ]/g, "")+`
            var k = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Confirm <span id="playername"></span></h2>
              </div>
              <div class="modal-body" style="margin:50px;">
                <form id="manage" method="post" style="margin:auto;text-align:center;">
                  <button style="position:unset !important;width:70% !important;" id="sendbonus" onclick="event.preventDefault();fireplayer('`+id+`','`+id.replace(":", "")+`');">Confirm</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(k)
          }
          if (e.id == 'garage') {
            //fireplayer('`+table.players[i].id+`','`+i.replace(/[^a-zA-Z ]/g, "")+`
            var k = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Vehicle not in garage: Pay 500 ? <span id="playername"></span></h2>
              </div>
              <div class="modal-body" style="margin:50px;">
                <form id="manage" method="post" style="margin:auto;text-align:center;">
                  <button style="position:unset !important;width:70% !important;" id="returnvehiclegarage" onclick="event.preventDefault();returnvehicle('`+id+`','`+id.replace(":", "")+`');">Confirm</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(k)
          }
          if (e.id == 'withdraw') {
            var give = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Withdraw Money <span id="playername"></span></h2>
              </div>
              <div class="modal-body">
                <form id="manage" method="post">
                  <input type="hidden" id="money_type" name="money_type" value="money">
                  <div class="select">
                    <select class="control control--select" id="moneyselect" onchange="moneytype()">
                      <option selected="selected" value="money">Money</option>
                      <option value="black_money">Black Money</option>
                    </select>
                  </div>
                  <label for="url" style="display: inline;
                  background: #011a40;
                  margin-right: 5px;
                  height: 40px;
                  padding-top: 11px;
                  padding-bottom: 10px;">Amount:</label>
                  <input type="text" id="amount" name="amount">
                  <button style="position:unset !important;" id="sendbonus" onclick="event.preventDefault();withdraw_deposit(0)">Send</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(give)
          }
          if (e.id == 'deposit') {
            var give = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Deposit Money <span id="playername"></span></h2>
              </div>
              <div class="modal-body">
                <form id="manage" method="post">
                  <input type="hidden" id="money_type" name="money_type" value="money">
                  <div class="select">
                    <select class="control control--select" id="moneyselect" onchange="moneytype()">
                      <option selected="selected" value="money">Money</option>
                      <option value="black_money">Black Money</option>
                    </select>
                  </div>
                  <label for="url" style="display: inline;
                  background: #011a40;
                  margin-right: 5px;
                  height: 40px;
                  padding-top: 11px;
                  padding-bottom: 10px;">Amount:</label>
                  <input type="text" id="amount" name="amount">
                  <button style="position:unset !important;" id="sendbonus" onclick="event.preventDefault();withdraw_deposit(1)">Send</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(give)
          }
          if (e.id == 'give') {
            var give = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Give Bonus to <span id="playername"></span></h2>
              </div>
              <div class="modal-body">
                <form id="manage" action="#" method="post">
                <label for="url" style="display: inline;
                background: #011a40;
                margin-right: 5px;
                height: 40px;
                padding-top: 11px;
                padding-bottom: 10px;">Amount:</label>
                  <input type="text" id="amount" name="amount">
                  <input type="hidden" id="id" name="id" value="`+id+`">
                  <button style="position:unset !important;" id="sendbonus" onclick="event.preventDefault();SerializePost()">Send</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(give)
          }
          if (e.id == 'grade') {
            var jobgrade = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:50%;background: #00000094;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Promote or Demote <span id="playername"></span></h2>
              </div>
              <div class="modal-body">
              <div class="container">
                <form name="jobgrade" id="jobgrade" style="    max-width: 99%;
                margin: 10px;
                padding: 20px 20px;
                border-radius: 8px;
                height: auto;
                overflow-x: hidden;
                max-height: 70vh;
                background: #1e1e1f21;">

                </form>
              </div>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(jobgrade)
            for (const i in jobdata.grade) {
              var gradestring = `<div class="option" style="width:100%;background: #0000003b;
              margin-top: 5px;
              color: #bbe6ff;
              font-family: 'Font Awesome 5 Free';border-radius:5px">
              <input type="radio" name="grade" id="`+i+`" value="`+i+`">
              <label for="`+i+`" aria-label="`+i+`" style="width:90%;">
                <span></span>
                
                `+jobdata.grade[String(i)].label+`
                
                <div class="job job--white job--sm" style="background-image: url(img/`+myjob+`/`+i+`.png);
                background-size: 100% 100%;
                background-repeat: no-repeat;">
                </div>
              </label>
              </div>`
              $('#jobgrade').prepend(gradestring)
            }
            const promote = document.jobgrade.grade;
            var prev = null;
            for(var i = 0; i < promote.length; i++) {
              promote[i].onclick = function () {
                //(prev)? 
                if(this !== prev) {
                    prev = this;
                }
                
                $.post("https://renzu_jobs/setjob",JSON.stringify({grade:this.value,id:id}),function(cb){
                  if (cb) {
                    
                  }
                });
              };
            }
          }

          if (e.id == 'salary') {
            var salarystring = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:50%;background: #00000094;">
              <div class="modal-header">
                <span class="close" onclick="CloseModal()">×</span>
                <h2 style="text-align:center;">Salary Management <span id="playername"></span></h2>
              </div>
              <div class="modal-body">
              <div class="container">
                <form name="salarydiv" id="salarydiv" style="    max-width: 99%;
                margin: 10px;
                padding: 20px 20px;
                border-radius: 8px;
                height: auto;
                overflow-x: hidden;
                max-height: 70vh;
                background: #1e1e1f21;    width: 80%;">

                </form>
              </div>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(salarystring)
            for (const i in jobdata.grade) {
              var gradestring = `<div class="option" style="width:100%;background: #0000003b;
              margin-top: 5px;
              color: #bbe6ff;
              font-family: 'Font Awesome 5 Free';border-radius:5px">
              <label for="`+i+`" aria-label="`+i+`" style="width:90%;">
                <span style="border-width: 0px;
                background: #0000;"> <i class="fas fa-medal"></i></span>
                
                `+jobdata.grade[String(i)].label+`
                
                <div id="salaryedit" style="background: #0f2a5d82;
                padding: 5px;
                border-radius: 5px;
                text-align: center;
                font-family: monospace;"> <i id="salarymanage" onclick="OpenModalFunction(this, '`+i+`','`+jobdata.grade[String(i)].label+`')" style="    position: absolute;
                right: 27%;
                color: #4ec1a1;
                background: #162e58;
                padding: 5px;
                border-radius: 20%;
                font-size:21px;
                top: 30%;" class="fas fa-money-check-edit-alt"></i> `+jobdata.grade[String(i)].salary+`
                </div>
              </label>
              </div>`
              $('#salarydiv').prepend(gradestring)
            }
          }
          if (e.id == 'salarymanage') {
            var give = `<div id="`+e.id+`" class="modal" style="display: block;">
            <div class="modal-content" style="width:40%;">
              <div class="modal-header">
                <span class="close" onclick="this.parentNode.parentNode.parentNode.remove()">×</span>
                <h2 style="text-align:center;">Change Current Salary - `+label+` <span id="playername"></span></h2>
              </div>
              <div class="modal-body">
                <form id="manage" action="#" method="post">
                <label for="url" style="display: inline;
                background: #011a40;
                margin-right: 5px;
                height: 40px;
                padding-top: 11px;
                padding-bottom: 10px;">Amount:</label>
                  <input type="text" id="amount" name="amount">
                  <input type="hidden" id="grade" name="grade" value="`+id+`">
                  <button style="position:unset !important;" id="sendbonus" onclick="event.preventDefault();salarymanage()">Save</button>
                </form>
              </div>
            </div>
            </div>`
            $('#modalfunc').append(give)
          }
        }

        function defaultimg(e) {
          
          document.getElementById(e.id).src = 'https://www.teamaxe.com/img/cms/livraison-teamaxe1.png'
        }
        function moneytype() {
          document.getElementById("money_type").value = document.getElementById("moneyselect").value
        }

        function SaveF() {
          var val = document.getElementById("saveto").value
          if (val !== 'new') {
            document.getElementById("clothelabel").style.display = 'none'
            document.getElementById("savenew").style.display = 'none'
            document.getElementById("savenew").disabled = true
          } else {
            document.getElementById("clothelabel").style.display = 'inline'
            document.getElementById("savenew").style.display = 'inline'
            document.getElementById("savenew").disabled = false
          }
          document.getElementById("save_to").value = val
        }

        function salarymanage() {
          var v = $( "form" ).serializeArray()
          //
          var grade = 0
          var amount = 0
          for (const i in v) {
            if (v[i].name == 'grade') {
              grade = v[i].value
            }
            if (v[i].name == 'amount') {
              amount = v[i].value
            }
          }
          
          $.post("https://renzu_jobs/changesalary",JSON.stringify({grade:grade,amount:amount}),function(cb) {
            if (cb) {
              $('#modalfunc').html('')
            }
          });
        }

        function craft(item,type) {
          var v = $( "form" ).serializeArray()
          //
          var grade = 0
          var amount = 0
          for (const i in v) {
            if (v[i].name == 'amount') {
              amount = v[i].value
            }
          }
          
          $.post("https://renzu_jobs/craftitem",JSON.stringify({item:item,amount:amount,type:type}),function(cb) {
            if (cb) {
              $('#modalfunc').html('')
            }
          });
        }

        function SerializePost() {
          var v = $( "form" ).serializeArray()
          //
          $.post("https://renzu_jobs/sendbonus",JSON.stringify({t:v}),function(cb){
            if (cb) {
              $('#modalfunc').html('')
            }
          });
        }

        function getweapon(e,weapon) {
          $.post("https://renzu_jobs/getweapon",JSON.stringify({weapon:weapon}),function(cb) {
              if (cb) {
                //document.getElementById(weapon).style.color = '';
              }
          });
        }

        function buyvehicle(model) {
          
          $.post("https://renzu_jobs/buyvehicle",JSON.stringify({model:model}),function(cb) {
              if (cb) {
                window.location.reload(false)
                //document.getElementById(weapon).style.color = '';
              }
          });
        }

        function spawnvehicle(e,plate) {
          
          var prop = ownedvehicles[plate].prop
          $.post("https://renzu_jobs/spawnvehicle",JSON.stringify({plate:plate,prop:prop}),function(cb) {
              if (cb) {
                window.location.reload(false)
                //document.getElementById(weapon).style.color = '';
              }
          });
        }

        function returnvehicle(plate) {
          
          var prop = ownedvehicles[plate].prop
          $.post("https://renzu_jobs/returnvehicle",JSON.stringify({plate:plate,prop:prop}),function(cb) {
              if (cb) {
                window.location.reload(false)
                //document.getElementById(weapon).style.color = '';
              }
          });
        }

        function itemfunc(type,id) {
          for (const i in $( "form" ).serializeArray()) {
            var u = $( "form" ).serializeArray()
            $.post("https://renzu_jobs/itemfunc",JSON.stringify({amount:u[i].value,item:id,type:type}),function(cb) {
              if (cb) {
                $('#modalfunc').html('')
              }
            });
          }
        }

        function Saveclothes(type,id) {
          var newclothe = undefined
          var overwriteold = undefined
          for (const i in $( "form" ).serializeArray()) {
            var u = $( "form" ).serializeArray()
            if ($( "form" ).serializeArray()[i].name == 'savenew') {
              newclothe = $( "form" ).serializeArray()[i].value
            }
            if ($( "form" ).serializeArray()[i].name == 'save_to') {
              overwriteold = $( "form" ).serializeArray()[i].value
            }
            
          }
          $.post("https://renzu_jobs/saveclothes",JSON.stringify({newclothe:newclothe,overwriteold:overwriteold}),function(cb) {
            if (cb) {
              $('#modalfunc').html('')
            }
          });
        }

        function withdraw_deposit(type) {
          var v = $( "form" ).serializeArray()
          //
          var amount = 0
          var money_type = 'money'
          for (const i in $( "form" ).serializeArray()) {
            var u = $( "form" ).serializeArray()
            if (u[i].name == 'amount') {
              amount = u[i].value
            }
            if (u[i].name == 'money_type') {
              money_type = u[i].value
            }
          }
          
          $.post("https://renzu_jobs/withdraw_deposit",JSON.stringify({amount:amount,type:type,money_type:money_type}),function(cb) {
            if (cb) {
              $('#modalfunc').html('')
            }
          });
        }

        function fireplayer(id,i) {
          //var v = $( "form" ).serializeArray()
          
          $.post("https://renzu_jobs/kick",JSON.stringify({id:id}),function(cb){
            if (cb) {
              $('#'+i+'').remove('')
              CloseModal()
            }
          });
        }

        function CloseModal(cursor) {
          $('#modalfunc').html('')
          if (cursor) {
            $.post("https://renzu_jobs/close",{},function(datab){
              window.location.reload(false); 
            });
          }
        }

        function openprofile(id) {
          $.post("https://renzu_jobs/getinfo",JSON.stringify({id:id}),function(data){
            var card = `<div class="card light">
        <div class="card-header">
          <div class="back" onclick="refresh()">
            <i class="fas fa-arrow-left" aria-hidden="true"></i>
          </div>
          <div class="options">
            <i class="far fa-bookmark" aria-hidden="true"></i>
            <i class="fas fa-ellipsis-v" aria-hidden="true"></i>
          </div>
        </div>
        <div class="card-text">
          <div class="card-img" id="avatar2">
            <i class="fas fa-check-circle" aria-hidden="true"></i>
          </div>
          <h2>`+data[id].name+`</h2>
          <h5>`+data[id].job+`</h5>
          <div class="socials">
            <br>
            <i style="color:skyblue;" id="grade" onclick="OpenModalFunction(this,'`+data[id].id+`','`+data[id].job+`')" class="fad fa-chart-line"></i>
            <i style="color:lime;" id="give" onclick="OpenModalFunction(this,'`+data[id].id+`')" class="fad fa-hands-usd"></i>
            <i style="color:red;" onclick="fireplayer('`+data[id].id+`','`+data[id].id.replace(":", "")+`')" class="fad fa-user-times"></i>
          </div>
          <p>Create usuble interface </p>
          <button>Fire me</button>
        </div>
        <div class="card-stats">
          <div class="stats">
            <div class="value">400</div>
            <div class="type"> DUTY HOURS </div>
    
          </div>
          <div class="stats">
            <div class="value">12.8K</div>
            <div class="type">SALARY</div>
          </div>
          <div class="stats">
            <div class="value">6722</div>
            <div class="type">ACHIEVEMENT</div>
          </div>
        </div>
      </div>`
          $('#jobmain').html('');
          $('#jobmain').append(card);
          $('#avatar2').css("background-image", "url("+data[id].image+")");  
            
          });
        }

        function give(id) {
          
          //document.getElementById("main").innerHTML = '';
          $.post("https://renzu_jobs/give",{},function(data){});
        }

        function buy(id) {
          
          //document.getElementById("main").innerHTML = '';
          var amount = 0
          for (const i in $( "form" ).serializeArray()) {
            var u = $( "form" ).serializeArray()
            if ($( "form" ).serializeArray()[i].name == 'amount') {
              amount = $( "form" ).serializeArray()[i].value
            }
          }
          $.post("https://renzu_jobs/buyitem",JSON.stringify({item:id,amount:amount}),function(data){
            if (data) {
              $('#modalfunc').html('')
            }
          })
        }

        function refresh(id) {
          document.getElementById("jobmain").innerHTML = '';
          $.post("https://renzu_jobs/refresh",{},function(data){});
        }

        function capitalizeFirstLetter(string) {
          return string.charAt(0).toUpperCase() + string.slice(1);
        }

        function nav(e,id,next) {
          var val = document.getElementById(id).value
          
          if (next) {
            val = +val + 1
          } else {
            val = val - 1
          }
          
          document.getElementById(id).value = val
          $.post("https://renzu_jobs/changeclothes",JSON.stringify({name:id,value:val}),function(cb) {
            if (cb) {}
          });
        }

        window.addEventListener('message', function (table) {
          let event = table.data;
          if (event.type == 'css') {
            if (event.content == 'old') {
              document.getElementById("css_default").disabled = true;
              $('link[href="stylenew.css"]').remove();
              $('head').append('<link rel="stylesheet" type="text/css" href="styleold.css">');
            } else {
              $('head').append('<link rel="stylesheet" type="text/css" href="stylenew.css">');
            }
          }
          if (event.type == 'update') {
            
            document.getElementById("moneyval").innerHTML = event.data['money'];
            document.getElementById("blackmoneyval").innerHTML = event.data['black_money'];
          }
          if (event.type == 'show') {
            event.type = undefined
            
            jobdata = event.content.jobdata
            myjob = event.content.myjob
            if (event.content.myimage !== undefined) {
              $("#myavatar").attr("src", event.content.myimage);
              $("#currentavatar").attr("src", event.content.myimage);
            }
            $("#logo").attr("src", event.content.logo);
            Addplayers(event.content)
            document.getElementById("jobmenu").style.display = "block";
            //document.getElementById("count").innerHTML = event.content.count;
            //document.getElementById("max").innerHTML = event.content.max;
            document.getElementById("blackmoneyval").innerHTML = event.content.money['black_money'];
            document.getElementById("moneyval").innerHTML = event.content.money['money'];
            imglink = event.content.img
          }

          if (event.type == 'showinv') {
            event.type = undefined
            $("#logo").attr("src", event.content.logo);
            
            CreateInventory(event.content.inventory,event.content.img,event.content.job_inventory)
            document.getElementById("jobitem").style.display = "block";
            imglink = event.content.img
          }
          if (event.type == 'Weapons') {
            const weapon = event.content.weapons
            weapondata = undefined
            event.type = undefined
            $("#logo").attr("src", event.content.logo);
            
            weapondata = weapon
            CreateWeapons(weapon,event.content.img)
            event.content.weapons = undefined
            imglink = event.content.img
            document.getElementById("weaponmenu").style.display = "block";
          }
          if (event.type == 'Clothes') {
            const clothe = event.content.clothe
            event.type = undefined
            $("#logo").attr("src", event.content.logo);
            
            CreateClothes(clothe,event.content.img)
            wardrobe = event.content.wardrobe
            imglink = event.content.img
            document.getElementById("clothemenu").style.display = "block";
          }
          if (event.type == 'Shop') {
            const shop = event.content.shop
            event.type = undefined
            $("#logo").attr("src", event.content.logo);
            
            CreateShop(shop,event.content.img)
            imglink = event.content.img
            document.getElementById("shopmenu").style.display = "block";
          }
          if (event.type == 'Crafting') {
            const crafting = event.content.crafting
            event.type = undefined
            $("#logo").attr("src", event.content.logo);
            
            CreateCrafting(crafting,event.content.img)
            imglink = event.content.img
            document.getElementById("craftingmenu").style.display = "block";
          }
          if (event.type == 'Duty') {
            const duty = event.content.duty
            event.type = undefined
            $("#logo").attr("src", event.content.logo);
            
            OpenModalFunction({id :'duty'},duty.job,duty.off,duty.jobname)
            off = duty.job == duty.off
            if (off && offduty) {
              var temp = on_switch
              on_switch = off_switch
              off_switch = temp;
              offduty = false
              $("#switch_on").attr('class', on_switch);
              $("#switch_off").attr('class', off_switch);
            }
          }
          if (event.type == 'Garage') {
            const garage = event.content.garagedata
            event.type = undefined
            $("#logo").attr("src", event.content.logo);
            
            CreateGarage(garage,event.content.img)
            document.getElementById("garagemenu").style.display = "block";
          }

          if (event.type == 'VehicleShop') {
            const vehicleshop = event.content.vehicleshop
            event.type = undefined
            $("#logo").attr("src", event.content.logo);
            
            CreateVehicleShop(vehicleshop,event.content.img)
            document.getElementById("vehicleshopmenu").style.display = "block";
          }

          if (event.type == 'updateclothe') {
            const clothe = event.clothe.name
            const clothemax = event.clothe.max
            event.type = undefined
            
            $('#'+clothe+'').attr('max', Number(clothemax));
            //$('#'+clothe+'').attr('value', 0);
            document.getElementById(clothe+'_id').setAttribute('max', Number(clothemax));
            document.getElementById(clothe+'_id').value = 0
          }
          if (event.type == 'close') {
            document.getElementById("jobmain").innerHTML = '';
            //document.getElementById("jobs").innerHTML = '';
            document.getElementById("clothemenu").style.display = "none";
            document.getElementById("jobmenu").style.display = "none";
            document.getElementById("jobitem").style.display = "none";
            document.getElementById("weaponmenu").style.display = "none";
            document.getElementById("shopmenu").style.display = "none";
            document.getElementById("garagemenu").style.display = "none";
            document.getElementById("craftingmenu").style.display = "none";
            document.getElementById("vehicleshopmenu").style.display = "none";
            $('#weaponcomponents').html('')
            $('#jobgrade').html('')
            weapondata = {}
            window.location.reload(false); 
          }
        });
        document.onkeyup = function (data) {
          if (data.keyCode == '27') { // Escape key 76 = L (Change the 76 to whatever keycodes you want to hide the carlock ui LINK https://css-tricks.com/snippets/javascript/javascript-keycodes/)
            $.post("https://renzu_jobs/close",{},function(datab){});
            document.getElementById("clothemenu").style.display = "none";
            document.getElementById("jobmenu").style.display = "none";
            document.getElementById("jobmain").innerHTML = '';
            document.getElementById("jobitem").style.display = "none";
            document.getElementById("weaponmenu").style.display = "none";
            document.getElementById("shopmenu").style.display = "none";
            document.getElementById("garagemenu").style.display = "none";
            document.getElementById("craftingmenu").style.display = "none";
            document.getElementById("vehicleshopmenu").style.display = "none";
            weapondata = {}
            //document.getElementById("jobs").innerHTML = '';
            $('#weaponcomponents').html('')
            $('#jobgrade').html('')
            window.location.reload(false); 
          }
          if (data.keyCode == '121') { // Escape key 76 = L (Change the 76 to whatever keycodes you want to hide the carlock ui LINK https://css-tricks.com/snippets/javascript/javascript-keycodes/)
            $.post("https://renzu_jobs/close",{},function(datab){});
            document.getElementById("jobmenu").style.display = "none";
            document.getElementById("jobitem").style.display = "none";
            document.getElementById("weaponmenu").style.display = "none";
            document.getElementById("shopmenu").style.display = "none";
            weapondata = {}
            document.getElementById("jobmain").innerHTML = '';
            document.getElementById("garagemenu").style.display = "none";
            document.getElementById("craftingmenu").style.display = "none";
            document.getElementById("vehicleshopmenu").style.display = "none";
            //document.getElementById("jobs").innerHTML = '';
            $('#weaponcomponents').html('')
            $('#jobgrade').html('')
            window.location.reload(false); 
          }
        }
        function imageExists(image_url){

          var http = new XMLHttpRequest();
      
          http.open('HEAD', image_url, false);
          http.send();
      
          return http.status != 404;
      
        }
        // Get the modal
      var modal = document.getElementById("myModal");
      
      // Get the button that opens the modal
      
      
      // Get the <span> element that closes the modal
      var span = document.getElementsByClassName("close")[0];
      
      // When the user clicks the button, open the modal
      
      // When the user clicks on <span> (x), close the modal
      // span.onclick = function() {
      //   modal.style.display = "none";
      // }
      
      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function(event) {
        if (event.target == modal) {
          modal.style.display = "none";
        }
      }
      function checkURL(url) {
        return(url.match(/\.(jpeg|jpg|gif|png)$/) != null);
      }