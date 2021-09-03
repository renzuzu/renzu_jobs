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

# TODO
- Blackmoney Support in Inventory (i forgot silly me)
- Simple Dispatch System (discord channel style)
- Support Black money requirements in shop
- Ingame Job Adder/Creator (if many will request, i dont think this is needed at all)
- Gangwar Feature
- Raid Feature
- Odd Job / Task for Each Job/gangs
- Weapon Tints @ Armory
- Clothe Index Number in UI
- REDO Some UI Part Element Responsiveness
