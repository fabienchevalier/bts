# Importe le CMDLET AD
Import-Module ActiveDirectory
  
# Crée la variable "ADUsers" contennant le fichier CSV
$ADUsers = Import-Csv users.csv -Delimiter ";"

# Boucle permettant de créer chaque users en fonction du fichier CSV 
foreach ($User in $ADUsers) {

    #Parse le document et crée les variables en fonction du fichier CSV
    $nomutilisateur = $User.Nom_User
    $mdp = $User.Mdp
    $prenom = $User.Prenom
    $nom = $User.Nom
    $initiales = $User.Initiales
    $OU = $User.OU

    # Test si l'utilisateur est déjà présent dans l'AD
    if (Get-ADUser -F { SamAccountName -eq $nomutilisateur }) {
        
        # Si l'user existe, donne un avertissement
        Write-Warning "L'utilisateur est déjà présent dans l'AD"
    }
    else {

        # L'user n'existe pas, on procède à la création
        New-ADUser `
            -SamAccountName $nomutilisateur `
            -Name "$prenom $nom" `
            -GivenName $prenom `
            -Surname $nom `
            -Initials $initiales `
            -Enabled $True `
            -DisplayName "$nom, $prenom" `
            -Path $OU `
            -AccountPassword (ConvertTo-secureString $mdp -AsPlainText -Force)

        # Si l'user est créé, on affiche le message
        Write-Host "The user account $username is created." -ForegroundColor Cyan

    }
}

Read-Host -Prompt "Press Enter to exit"