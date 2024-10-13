Config = {}

Config.Locale = 'fr'

Config.WhitelistedGroups = {
    ["founder"] = 1,
    ["superadmin"] = 2,
    ["admin"] = 3,
    ["mod"] = 4
}

Config.Messages = {
    ['fr'] = {
        no_permission = "Vous n'avez pas la permission d'utiliser cette commande.",
        invalid_id = "ID invalide.",
        ban_success = "Le joueur avec l'ID %d a été banni pour la raison suivante : %s",
        cannot_ban_higher = "Vous ne pouvez pas bannir un joueur avec un grade supérieur.",
        bvan_description = "Bannir un joueur avec un ID et une raison optionnelle.",
        bvan_id_help = "L'ID du joueur à bannir.",
        bvan_reason_help = "(Facultatif) La raison du bannissement."
    },
    ['en'] = {
        no_permission = "You do not have permission to use this command.",
        invalid_id = "Invalid ID.",
        ban_success = "The player with ID %d has been banned for the following reason: %s",
        cannot_ban_higher = "You cannot ban a player with a higher rank.",
        bvan_description = "Ban a player by ID with an optional reason.",
        bvan_id_help = "The ID of the player to ban.",
        bvan_reason_help = "(Optional) The reason for the ban."
    }
}
