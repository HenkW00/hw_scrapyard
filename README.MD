# HW Scrapyard

`hw_scrapyard` is a resource for FiveM that introduces an engaging scrapyard system for ESX servers. It allows players to search specific locations for scrap items, which they can then sell for a profit. This script adds an interactive and immersive element to the server, encouraging exploration and providing a new revenue stream for players.

## Features

- **Dynamic Scrapyard Locations**: Configurable locations where players can search for scrap.
- **Search Animation**: Players perform a searching animation when looking for scrap.
- **Configurable Items**: Define which items can be found and their probabilities.
- **Cooldown System**: Prevents spamming search at the same location.
- **Discord Logging**: Supports Discord webhooks for logging player actions.
- **Multilingual Support**: Easy localization through the `locales` directory.

## Installation

1. **Download the Resource**:
    - Clone this repository or download the ZIP package.

2. **Extract and Place**:
    - Extract the folder into your server's `resources` directory.

3. **Configure the Resource**:
    - Edit the `config/config.lua` file to adjust settings like scrap locations, items, and probabilities.

4. **Add to Server Configuration**:
    - Add the following line to your server's `server.cfg` file:
      ```
      ensure hw_scrapyard
      ```

5. **Restart Your Server**:
    - If your server is running, restart it to load the new resource.

## Usage

Players can approach the configured scrapyard locations indicated by blips on the map. At these locations, they can start searching for scrap items by pressing the interaction key (`E` by default). Upon completion of the search, they will receive a random item based on the configured probabilities. Players can then sell these items at a designated location (not provided by this script).

## Configuration

- **Scrap Locations**: Define the coordinates and search probabilities in `config/config.lua`.
- **Items**: Configure the items and their probabilities in the same config file.
- **Discord Logging**: Set your Discord webhook URL in the config file for action logging.

## Discord Logging Setup

To enable Discord logging, you must create a Discord webhook in your server settings and paste the webhook URL into the `config/config.lua` file.

## Localization

To edit or add new languages, modify the files in the `locales` directory. Use the provided English template (`en.lua`) as a reference.

## Support

For issues, suggestions, or contributions, please use the GitHub repository's issue tracker or pull requests.

## Credits

- Developed by HW Development.
- Thanks to the ESX framework and FiveM community for support and resources.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
