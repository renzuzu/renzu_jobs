# renzu_jobs
FIVEM - renzu_jobs - Basic Jobs Utility Needs for Roleplay Gameplay

# Feature 

# Boss Action 
- Salary Management
- Employee Management ( Promote / Demoted )
- Job Money ( Cash and Black Money )
- Send Bonus to Employee ( offline player can receive )
- Fire Employee (offline player can be fire)
# Inventory
- Boss Inventory ( Grade Level Permmision )
- Public Inventory ( ex. armory )
- Personal Inventory ( Player Owned Stash )
# Job Shop (business)
- Public Shop ( All Player can buy ) - Income money will go to Job money
- Private Shop - Want a Private shop for your job? ex. supply shop
- Item and Weapon Selling Supported
# Crafting
- Every job can have a crafting table
- Item Crafting
- Weapon Crafting
- Crafting Timer
# Wardrobe (SKINCHANGER ONLY Supported)
- Every Job can change its appearance or clothes
- Wardrobe ( Select Existing Clothes)
# Weapon Armory
- Job Grade Permission Per Weapons
- Customize Your Weapon Attachments
# Job Vehicle Shop
- Configurable Vehicle Shop
- Vehicle Model Pricing Configurable
- Auto Save to Garage
# Job Garage
- Player Owned Vehicles bought from vehicle will be stored here
- Any Vehicle can be stored here and it will be register as a job vehicle for this garage
- Simple Config
- Payable Lost Vehicles
- Anti Dupe Vehicle

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
- Renzu PopUi
- Renzu_Notify

# TODO
- Blackmoney Support in Inventory (i forgot silly me)
- Simple Dispatch System (discord channel style)
- Support Black money requirements in shop
- Ingame Job Adder/Creator (if many will request, i dont think this is needed at all)
- Gangwar Feature
- Raid Feature
- Odd Job / Task for Each Job/gangs