# Guide de déploiement ChatMgora sur Coolify

## Étape 1 : Préparer le dépôt Git

Le dépôt Git est déjà créé et disponible sur :
**https://github.com/BillyBob36/chatmgora-azure**

## Étape 2 : Configurer dans Coolify

### 2.1 Créer une nouvelle ressource

1. Connectez-vous à votre interface Coolify
2. Cliquez sur **"+ New Resource"**
3. Sélectionnez **"Docker Compose"**

### 2.2 Configuration du projet

1. **Source** : Sélectionnez "Git Repository"
2. **Repository URL** : `https://github.com/BillyBob36/chatmgora-azure`
3. **Branch** : `master`
4. **Docker Compose Location** : `docker-compose.yml`

### 2.3 Variables d'environnement

Dans Coolify, allez dans l'onglet **"Environment Variables"** et ajoutez ces variables :

**IMPORTANT : Remplacez les valeurs suivantes :**

```
MONGO_PASSWORD=VotreMotDePasseMongoDB_Securise
AZURE_OPENAI_API_KEY=VOTRE_CLE_AZURE_ICI
DOMAIN_CLIENT=https://votre-domaine.coolify.io
DOMAIN_SERVER=https://votre-domaine.coolify.io
JWT_SECRET=GenerezUnSecretAleatoire32Caracteres
JWT_REFRESH_SECRET=GenerezUnAutreSecretAleatoire32Caracteres
CREDS_KEY=GenerezUnSecretPourCreds32Caracteres
CREDS_IV=Secret16Chars123
ALLOW_REGISTRATION=true
SESSION_EXPIRY=604800000
REFRESH_TOKEN_EXPIRY=2592000000
```

**Note** : Le domaine sera fourni automatiquement par Coolify après la création de la ressource.

### 2.4 Configuration du domaine

1. Dans Coolify, allez dans **"Domains"**
2. Coolify vous fournira automatiquement un sous-domaine (ex: `chatmgora-xyz.coolify.io`)
3. Copiez ce domaine et mettez à jour les variables `DOMAIN_CLIENT` et `DOMAIN_SERVER`

### 2.5 Déployer

1. Cliquez sur **"Deploy"**
2. Attendez que le déploiement se termine (5-10 minutes)
3. Vérifiez les logs pour vous assurer qu'il n'y a pas d'erreurs

## Étape 3 : Première connexion

### 3.1 Créer votre compte

1. Accédez à votre domaine Coolify
2. Cliquez sur **"Sign Up"**
3. Créez votre compte avec votre email et mot de passe
4. Connectez-vous

### 3.2 Tester Azure OpenAI

1. Une fois connecté, vous verrez l'interface LibreChat
2. Dans le sélecteur de modèle, choisissez **"gpt-5.2-chat-2"**
3. Envoyez un message de test
4. Vous devriez recevoir une réponse de GPT-5.2 via Azure OpenAI

## Étape 4 : Désactiver l'enregistrement (optionnel)

Une fois que vous et vos utilisateurs avez créé vos comptes :

1. Dans Coolify, modifiez la variable d'environnement :
   ```
   ALLOW_REGISTRATION=false
   ```
2. Redéployez l'application

## Dépannage

### Erreur de connexion MongoDB
- Vérifiez que le service MongoDB est bien démarré dans Coolify
- Vérifiez les logs : `docker logs chatmgora-mongodb`

### Erreur Azure OpenAI
- Vérifiez que votre clé API est correcte
- Vérifiez que votre déploiement Azure est actif
- Consultez les logs LibreChat : `docker logs chatmgora-app`

### Impossible d'accéder à l'application
- Vérifiez que le port 3000 est bien exposé
- Vérifiez la configuration du domaine dans Coolify
- Vérifiez les variables DOMAIN_CLIENT et DOMAIN_SERVER

## Configuration Azure OpenAI

Votre configuration Azure :
- **Endpoint** : `https://infan-mkcivtsn-eastus2.cognitiveservices.azure.com/`
- **Déploiement** : `gpt-5.2-chat-2`
- **Modèle** : `gpt-5.2-chat`
- **API Version** : `2024-12-01-preview`

## Support

Pour plus d'informations :
- Documentation LibreChat : https://docs.librechat.ai
- Documentation Coolify : https://coolify.io/docs
- Documentation Azure OpenAI : https://learn.microsoft.com/azure/ai-services/openai/
