Config = {}

-- Languages
Config.Locale = 'fr' -- ('fr' or 'en')

-- Groups WL
Config.WhitelistedGroups = {
    "founder",
    "superadmin",
    "mod"
}

-- Traductions
Config.Messages = {
    ['fr'] = {
        no_permission = "Vous n'avez pas la permission d'utiliser cette commande.",
        invalid_id = "ID invalide.",
        ban_success = "Le joueur avec l'ID %d a été banni pour la raison suivante : %s"
    },
    ['en'] = {
        no_permission = "You do not have permission to use this command.",
        invalid_id = "Invalid ID.",
        ban_success = "The player with ID %d has been banned for the following reason: %s"
    }
}
