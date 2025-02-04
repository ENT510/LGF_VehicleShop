# LGF_VehicleShop

## Overview

LGF_Vehicle Shop is a simple vehicle shop system for **FiveM** servers. It lets players explore, buy, and test-drive vehicles from the shop, making it easy for players to get the vehicle they want.

---

## Features

- **Vehicle Categories**: Vehicles are grouped into categories for easier browsing.
- **Preview & Test Drive**: Players can preview and test drive vehicles before purchasing.
- **Customizable**: You can easily add and configure vehicles, setting prices, descriptions, and other details.
- **Job Restrictions**: The shop supports job-based restrictions, so only specific jobs can access the vehicle purchase options.
- **Interaction Systems**: Supports **TextUI** and **ox_target** for player interaction, but being open-source, it's easy to implement other types of interactions.

---

## Supported Frameworks

LGF_Vehicle Shop works with the following frameworks:

- **LegacyCore**
- **ESX**
- **Qbox**
- **ND_Core**
- **Ox_Core**
- **Qb-Core**

Make sure you have the correct framework set up for it to work properly.

---

## Dependencies

LGF_Vehicle Shop requires the following resources to work correctly:

- **ox_lib**: Required for the general functionality of the system.
- **ox_inventory**: Required if you plan to manage inventory-related actions or items in the vehicle shop.
- **LGF_UiPack**: Required for the UI elements like ContextMenu and interactions (TextUI) in the shop.
- **ox_target**: Optional. If you want to use the **ox_target**.

Make sure you install these dependencies before using the vehicle shop.

---

## Configuration

You can configure the shop settings, vehicles, and more in the `modules/client/cl-config.lua` file. This allows you to:

---
