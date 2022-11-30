# renzu_jobs
FIVEM - renzu_jobs - Basic Jobs Utility Needs for Roleplay Gameplay

# Feature 

# Boss Action 
- Salary Management
- Employee Management ( Promote / Demoted )
- Job Money ( Cash and Black Money )
- Send Bonus to Employee ( offline player can receive )
- Fire Employee (offline player can be fire)
![image](https://user-images.githubusercontent.com/82306584/132060622-8f41c603-2b9d-4a6f-ad5d-7d639a5ac782.png)
![image](https://user-images.githubusercontent.com/82306584/132060719-b933cbc1-9c67-4a23-98a0-1445054f16f5.png)

# Inventory
- Boss Inventory ( Grade Level Permmision )
- Public Inventory ( ex. armory )
- Personal Inventory ( Player Owned Stash )
- ![image](https://user-images.githubusercontent.com/82306584/132060788-64ec33a3-ff29-4938-8c32-25329d3766ac.png)

# Job Shop (business)
- Public Shop ( All Player can buy ) - Income money will go to Job money
- Private Shop - Want a Private shop for your job? ex. supply shop
- Item and Weapon Selling Supported
- ![image](https://user-images.githubusercontent.com/82306584/132060865-575fe3f0-336a-40f7-8b99-43388c2bf4a0.png)

# Crafting
- Every job can have a crafting table
- Item Crafting
- Weapon Crafting
- Crafting Timer
![image](https://user-images.githubusercontent.com/82306584/132060924-dd9704ca-80bd-418a-998a-288214fbafa1.png)

# Wardrobe (SKINCHANGER ONLY Supported)
- Every Job can change its appearance or clothes
- Wardrobe ( Select Existing Clothes)
![image](https://user-images.githubusercontent.com/82306584/132060991-138904cc-996d-4c5d-a1d4-cf715f17d3fc.png)

# Weapon Armory
- Job Grade Permission Per Weapons
- Customize Your Weapon Attachments
![image](https://user-images.githubusercontent.com/82306584/132061073-d6fe848f-372b-4341-8dc4-ad4bcb99f306.png)

# Job Vehicle Shop
- Configurable Vehicle Shop
- Vehicle Model Pricing Configurable
- Auto Save to Garage
- ![image](https://user-images.githubusercontent.com/82306584/132061118-80db182c-ec66-4bd0-8b80-0ff23cedd155.png)

# Job Garage
- Player Owned Vehicles bought from vehicle will be stored here
- Any Vehicle can be stored here and it will be register as a job vehicle for this garage
- Simple Config
- Payable Lost Vehicles
- Anti Dupe Vehicle
- ![image](https://user-images.githubusercontent.com/82306584/132061138-ff70d23d-badb-48cf-841d-5830bff62961.png)


# Other important info
- Each Job Feature can be limit by grade access
- All Jobs Data came from jobs, job_grades table (ESX)
- Society Money (ESX Society) data can be grab once to transfer it to renzu_jobs database.
- PopUI can be used disable by default

# Job Money Data
```
  local money = 0
  ESX.TriggerServerCallback("renzu_jobs:getJobmoney",function(money)
      money = money
  end,'police', 'money')
  - first var is job , second var is type ex. black_money, money
```

# Inventory Image CONFIG
```
config.inventory = 'esx_inventoryhud'
```
- change this to your inventory script folder name
```
config.inventoryImageUrl = 'https://cfx-nui-'..config.inventory..'/html/img/items/'
```
- Verify the path ex. /html/img/items/ ,, if its correct.
- Images from your inventory will be used ,instead of hosting it in renzu_jobs folder.

# Webhook
- Discord Webhook is Supported
- Each Job Feature have a webhook and its set to false as default, change it to your discord webhooklink

# Dependency
- ESX FRAMEWORK (Tested V1 final, ESX LEGACY)
- ESX Society ( OPTIONAL )
- Renzu PopUi - https://github.com/renzuzu/renzu_popui
- Renzu_Notify - https://github.com/renzuzu/renzu_notify

# Commands
- Job Creator
- Command: /jobcreator
![image](https://user-images.githubusercontent.com/82306584/204890182-14deee04-fca0-4d98-bb4e-946831c5488c.png)
![image](https://user-images.githubusercontent.com/82306584/204890268-202e9596-92eb-406f-93e1-e41c378606b3.png)

- in able to use newly added jobs from jobs creator command, you need to trigger the command to refresh the job list of ESX.Jobs

- files needed to Edit ( es_extended/server/main.lua )
- add this new code to the bottom of main.lua

```
RegisterNetEvent('esx:updatejobs')
AddEventHandler('esx:updatejobs', function(src,jobs)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if source == '' or source == nil then source = 0 end
	if source == 0 and xPlayer.getGroup() == 'superadmin' or source == 0 and xPlayer.getGroup() == 'admin' then
		ESX.Jobs = jobs
		print('[^2INFO^7] ESX ^5Legacy^0 Job Refreshed')
	end
end)
```

# Money Wash
- Preconfigured Money wash using IPL
- Default 4 available Washing slot
- can be owned by job
- Tax

# Interaction (WIP)
- this need renzu_contextmenu
- Configurable Interaction
- Event Firing Logic
- command /interaction (or bind it to F6 if you like)
[details="Sample How to Setup Interaction"]
# Job Table in config ( example is in police default config )

|index|grade|type|
| --- | --- | --- |
|table identifier of this interaction eg 1 for cuff | default job grade to have this interaction| interaction type eg. citizen_interaction |
```

['interaction'] = {

            ['Citizen Interaction'] = {

                [1] = {index = 2, grade = 0, type = 'citizen_interaction'},

            },

            ['Vehicle Interaction'] = {

                [1] = {index = 2, grade = 0, type = 'vehicle_interaction'},

            },
 },
```
|table identifier | label | name |
| --- | --- | --- |
| int number ex. [1] for cuff | Menu Name | Event name |
```
# this is the config
config.citizen_interaction = {
    [1] = {label = 'Cuff', name = 'cuff'},
    [2] = {label = 'Check ID', name = 'checkid'},
    [3] = {label = 'Bill', name = 'bill'},
    [4] = {label = 'Search Citizen', name = 'searchplayer'},
    [5] = {label = 'Escort', name = 'drag1'},
    [6] = {label = 'Put in Vehicle', name = 'putinvehicle'},
    [7] = {label = 'Jail', name = 'jail'},
    [8] = {label = 'Gunshot Residue', name = 'gsr'},
    [9] = {label = 'Drug Swab Test', name = 'swabtest'},
    [10] = {label = 'Breathalizer', name = 'breathalizer'},
    [11] = {label = 'Manage License', name = 'managelicense'},
    [12] = {label = 'Check BP', name = 'checkbp1'},
    [13] = {label = 'Revive Citizen', name = 'revive1'},
    [14] = {label = 'Send to Emergency Room', name = 'sendtoemergencyroom'},
    [15] = {label = 'Revive Patient in Emergency Room', name = 'revive2'},
    [16] = {label = 'Heal Small Wounds', name = 'healsmall1'},
    [17] = {label = 'Drag Dead Body', name = 'drag2'},
    [18] = {label = 'Carry', name = 'carry1'},
}
config.vehicle_interaction = {
    [1] = {label = 'Drag out in Vehicle', name='dragout1'},
    [2] = {label = 'Lockpick', name='lockpick'},
    [3] = {label = 'Impound', name='impound'},
    [4] = {label = 'Use Car Jack', name='liftvehicle'},
    [5] = {label = 'Engine Repair', name='enginerepair1'},
    [6] = {label = 'Body Repair', name='bodyrepair1'},
    [7] = {label = 'Flatbed', name='flatbed1'},
    [8] = {label = 'Clean Vehicle', name='cleanvehicle1'},
    [9] = {label = 'Vehicle Chop', name='vehiclechop1'},
    [10] = {label = 'Put Body in Vehicle', name='putbodyinvehicle1'},
}
```
> you can use renzu_jobs\plugins
> to install custom lua files to use in interaction events (sample is provided)

> name for client files must start with cl_ and sv_ for server
[/details]



# TODO
- Blackmoney Support in Inventory (i forgot silly me) ✔️
- Simple Dispatch System (discord channel style)
- Support Black money requirements in shop
- Ingame Job Adder/Creator ✔️
- Gangwar Feature
- Raid Feature
- Odd Job / Task for Each Job/gangs
- Weapon Tints @ Armory
- Clothe Index Number in UI
- REDO Some UI Part Element Responsiveness
