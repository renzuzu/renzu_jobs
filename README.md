# renzu_jobs
FIVEM - renzu_jobs - Basic Jobs Utility Needs for Roleplay Gameplay

# Feature 

# Boss Action 
- Salary Management
- Employee Management ( Promote / Demoted )
- Job Money ( Cash and Black Money )
- Send Bonus to Employee ( offline player can receive )
- Fire Employee (offline player can be fire)
![image](https://user-images.githubusercontent.com/82306584/204890632-f621a291-d2fd-4cdb-8741-8600c6f9a4df.png)
![image](https://user-images.githubusercontent.com/82306584/204890704-d9ee1234-9397-4b5c-9d0a-145cd8aaa426.png)

# Inventory
- Boss Inventory ( Grade Level Permmision )
- Public Inventory ( ex. armory )
- Personal Inventory ( Player Owned Stash )
- ![image](https://user-images.githubusercontent.com/82306584/204890775-7f41431a-8cb6-43e9-b0d9-1303c8155937.png)

# Job Shop (business)
- Public Shop ( All Player can buy ) - Income money will go to Job money
- Private Shop - Want a Private shop for your job? ex. supply shop
- Item and Weapon Selling Supported
- ![image](https://user-images.githubusercontent.com/82306584/204890868-428e6624-2dfd-4f7f-825d-c13700897787.png)

# Crafting
- Every job can have a crafting table
- Item Crafting
- Weapon Crafting
- Crafting Timer
![image](https://user-images.githubusercontent.com/82306584/204890942-c7f092d3-f925-4801-8279-8dd4d0c22aa6.png)

# Wardrobe (SKINCHANGER ONLY Supported)
- Every Job can change its appearance or clothes
- Wardrobe ( Select Existing Clothes)
![image](https://user-images.githubusercontent.com/82306584/204891065-13ee1155-136e-48c5-a078-391e1e613f69.png)

# Weapon Armory
- Job Grade Permission Per Weapons
- Customize Your Weapon Attachments
![image](https://user-images.githubusercontent.com/82306584/204891235-3f35f78f-b5f3-4efe-810a-9cee56cd57c9.png)

# Job Vehicle Shop
- Configurable Vehicle Shop
- Vehicle Model Pricing Configurable
- Auto Save to Garage
- ![image](https://user-images.githubusercontent.com/82306584/204891357-0e8833ba-0071-47d1-8b1a-cc8ef25a94fb.png)

# Job Garage
- Player Owned Vehicles bought from vehicle will be stored here
- Any Vehicle can be stored here and it will be register as a job vehicle for this garage
- Simple Config
- Payable Lost Vehicles
- Anti Dupe Vehicle
- ![image](https://user-images.githubusercontent.com/82306584/204891303-1545ef6c-02c5-4e8f-be46-836afb52c1e2.png)


# Other important info
- Each Job Feature can be limit by grade access
- All Jobs Data came from jobs, job_grades table (ESX)
- Society Money (ESX Society) data can be grab once to transfer it to renzu_jobs database.
- PopUI can be used disable by default

# Job Money Exports
```
  local money = 0
  exports.renzu_job:JobMoney('police') -- return job money
  exports.renzu_job:addMoney(10000,'police',source,'money,true) -- add job money
  exports.renzu_job:removeMoney(10000,'police',source,'money',true,paycheck) -- remove job money @paycheck : true or false

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
- ESX FRAMEWORK (ESX LEGACY)
- Ox_lib

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
		ESX.RefreshJobs()
		print('[^2INFO^7] ESX ^5Legacy^0 Job Refreshed')
	end
end)
```

# Money Wash
- Preconfigured Money wash using IPL
- Default 4 available Washing slot
- can be owned by job
- Tax

# Interaction
![image](https://user-images.githubusercontent.com/82306584/204891552-2e2ff848-ddd7-4d7a-9efb-adbaafccc868.png)

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
