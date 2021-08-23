# Carte RPIDOM pour Raspberry Pi

La carte RPIDOM pour Raspberry Pi permet de se connecter à un compteur EDF pour récupérer la téléinformation et possède d'autres fonctionnalités:

### Bus 1-Wire
Le bus 1-Wire est un bus de terrain qui permet de connecter des capteurs, des entrées/sorties
déportées, etc... sur des distances importances (plusieurs dizaines de mètres).

### RTC
Une RTC est un composant qui permet à la Rasberry PI de conserver son heure courante lorsqu'il n'est
plus alimenté. 

### Téléinformation
Une liaison Téléinformation est le protocole de données utilisées par EDF/ERDF sur ses compteurs
électriques. Cette liaison est accessible à l'abonné et permet de recevoir en temps réel de nombreuses
informations de la part du compteur (consommation instantanée, index, etc...).


## La carte RPIDOM v2 offre les fonctionnalités suivantes :

- 2 x connecteurs téléinformation pour compteur type EDF opto-isolés (1200bds mode historique)
- 1 x connecteur bus domotique 1-wire (1wire hardware et protégé, pris en charge par les composant officiel Maxim/Dallas DS2482)
- 1 x horloge sauvegardée (RTC DS1338) par une super-capa rechargée automatiquement par le raspberry pi quand il est sous tension. 