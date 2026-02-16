# Post LinkedIn — Olympus Launch

> **Instructions** : Copier-coller le texte ci-dessous directement dans LinkedIn.
> Ajouter une image ou un screenshot du terminal montrant le Council review.
> Poster un mardi ou mercredi entre 8h et 9h30 CET pour max de reach.

---

J'ai passé 20 ans à reviewer du code.

En banque, en assurance, en télécom, en énergie — dans des environnements où un bug en production peut coûter des millions.

Et je me suis rendu compte d'un truc : les meilleurs reviewers ne sont pas ceux qui trouvent le plus de bugs.

Ce sont ceux qui regardent le code sous des angles différents.

Le gars sécurité voit l'injection SQL que personne n'a remarqué.
Le DDD purist voit que "account" et "customer" sont utilisés comme synonymes alors que le métier les distingue.
Le vieux de la vieille voit le edge case du 29 février qui va péter dans 4 ans.
Le pragmatique voit la classe de 400 lignes qu'on pourrait réduire à 40.

4 cerveaux. 4 angles. 4 filtres différents.

Le problème ? Avoir 4 seniors disponibles pour chaque review, c'est un luxe que personne ne peut se payer.

Alors j'ai créé Olympus.

4 agents IA spécialisés qui reviewent chaque modification de code :

🛡️ Athena — Sécurité (OWASP, injection, secrets, auth)
📐 Hermes — Domain-Driven Design (vocabulaire métier, bounded contexts)
🔮 Cassandra — Edge cases (ce qui va péter en prod)
☀️ Apollo — Simplicité (complexité cyclomatique, over-engineering)

Pas un framework. Pas un SaaS. Pas de code à maintenir.

Juste des prompts de qualité professionnelle, un workflow Kanban éprouvé, et une méthodologie de vibe coding structurée — le tout natif Claude Code.

L'idée m'est venue en observant les limites du vibe coding : le code généré fonctionne, mais accumule de la dette technique invisible. Alors j'ai packagé 20 ans d'expérience en code review dans 4 agents IA spécialisés, réutilisables sur n'importe quel projet.

Le résultat sur un vrai bout de code :

```
⚡ Olympus Council Review
Score: 35/100 — Verdict: ❌ Rejected

🛡️ Athena: CRITICAL — SQL injection via f-string (ligne 23)
🔮 Cassandra: CRITICAL — Aucune gestion du cas API timeout
📐 Hermes: WARNING — "data_point" ≠ vocabulaire métier établi
☀️ Apollo: WARNING — Fonction de 78 lignes, 5 niveaux d'imbrication
```

3 minutes. 4 angles. Zéro complaisance.

Le repo est open source (structure MIT, agents CC BY-NC-SA).

Lien en commentaire 👇

---

Si vous êtes data engineer, architecte, ou dev senior et que vous utilisez Claude Code / Cursor pour du vibe coding — essayez-le et dites-moi ce que vous en pensez.

Et si vous livrez du code à des clients : imaginez inclure ce rapport de qualité dans chaque delivery.

C'est exactement ce que je fais.

#ClaudeCode #VibeCoding #CodeReview #DataEngineering #AI #Freelance #OpenSource

---

> **Premier commentaire à poster immédiatement après publication** :
>
> 🔗 Le repo Olympus : https://github.com/ludovicschmetz-stack/olympus
>
> Pour démarrer en 2 minutes :
> ```
> git clone https://github.com/ludovicschmetz-stack/olympus.git mon-projet
> cd mon-projet
> ./init.sh --template data-platform --name "Mon Projet"
> claude
> ```
>
> Les 4 templates inclus : data-platform, web-api, dbt-project, generic.
> PRs et feedback bienvenus.
