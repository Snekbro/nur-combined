# where to find good stuff?
# - podcasts w/ a community: <https://lemmyverse.net/communities?query=podcast>
# - podcast rec thread: <https://lemmy.ml/post/1565858>
#
# candidates:
# - The Nonlinear Library (podcast): <https://forum.effectivealtruism.org/posts/JTZTBienqWEAjGDRv/listen-to-more-ea-content-with-the-nonlinear-library>
#   - has ~10 posts per day, text-to-speech; i would need better tagging before adding this
# - <https://www.metaculus.com/questions/11102/introducing-the-metaculus-journal-podcast/>
#   - dead since 2022/10 - 2023/03

{ lib, sane-data, ... }:
let
  hourly = { freq = "hourly"; };
  daily = { freq = "daily"; };
  weekly = { freq = "weekly"; };
  infrequent = { freq = "infrequent"; };

  art = { cat = "art"; };
  humor = { cat = "humor"; };
  pol = { cat = "pol"; };  # or maybe just "social"
  rat = { cat = "rat"; };
  tech = { cat = "tech"; };
  uncat = { cat = "uncat"; };

  text = { format = "text"; };
  img = { format = "image"; };

  mkRss = format: url: { inherit url format; } // uncat // infrequent;
  # format-specific helpers
  mkText = mkRss "text";
  mkImg = mkRss "image";
  mkPod = mkRss "podcast";

  # host-specific helpers
  mkSubstack = subdomain: { substack = subdomain; };

  fromDb = name:
    let
      raw = sane-data.feeds."${name}";
    in {
      url = raw.url;
      # not sure the exact mapping with velocity here: entries per day?
      freq = lib.mkIf (raw.velocity or 0 != 0) (lib.mkDefault (
        if raw.velocity > 2 then
          "hourly"
        else if raw.velocity > 0.5 then
          "daily"
        else if raw.velocity > 0.1 then
          "weekly"
        else
          "infrequent"
      ));
    } // lib.optionalAttrs (lib.hasPrefix "https://www.youtube.com/" raw.url) {
      format = "video";
    } // lib.optionalAttrs (raw.is_podcast or false) {
      format = "podcast";
    } // lib.optionalAttrs (raw.title or "" != "") {
      title = lib.mkDefault raw.title;
    };

  podcasts = [
    (fromDb "acquiredlpbonussecretsecret.libsyn.com" // tech)  # ACQ2 - more "Acquired" episodes
    (fromDb "allinchamathjason.libsyn.com" // pol)
    (fromDb "anchor.fm/s/34c7232c/podcast/rss" // tech)  # Civboot -- https://anchor.fm/civboot
    (fromDb "cast.postmarketos.org" // tech)
    (fromDb "congressionaldish.libsyn.com" // pol)  # Jennifer Briney
    (fromDb "craphound.com" // pol)  # Cory Doctorow -- both podcast & text entries
    (fromDb "darknetdiaries.com" // tech)
    (fromDb "feed.podbean.com/matrixlive/feed.xml" // tech)  # Matrix (chat) Live
    (fromDb "feeds.99percentinvisible.org/99percentinvisible" // pol)  # 99% Invisible -- also available here: <https://feeds.simplecast.com/BqbsxVfO>
    (fromDb "feeds.feedburner.com/80000HoursPodcast" // rat)
    (fromDb "feeds.feedburner.com/dancarlin/history" // rat)
    (fromDb "feeds.feedburner.com/radiolab" // pol)  # Radiolab -- also available here, but ONLY OVER HTTP: <http://feeds.wnyc.org/radiolab>
    (fromDb "feeds.libsyn.com/421877" // rat)  # Less Wrong Curated
    (fromDb "feeds.megaphone.fm/behindthebastards" // pol)  # also Maggie Killjoy
    # (fromDb "feeds.megaphone.fm/hubermanlab" // uncat)  # Daniel Huberman on sleep
    (fromDb "feeds.megaphone.fm/recodedecode" // tech)  # The Verge - Decoder
    (fromDb "feeds.simplecast.com/54nAGcIl" // pol)  # The Daily
    (fromDb "feeds.simplecast.com/82FI35Px" // pol)  # Ezra Klein Show
    (fromDb "feeds.simplecast.com/wgl4xEgL" // rat)  # Econ Talk
    (fromDb "feeds.simplecast.com/xKJ93w_w" // uncat)  # Atlas Obscura
    # (fromDb "feeds.simplecast.com/l2i9YnTd" // tech // pol)  # Hard Fork (NYtimes tech)
    (fromDb "feeds.transistor.fm/acquired" // tech)
    (fromDb "lexfridman.com/podcast" // rat)
    (fromDb "mapspodcast.libsyn.com" // uncat)  # Multidisciplinary Association for Psychedelic Studies
    (fromDb "omegataupodcast.net" // tech)  # 3/4 German; 1/4 eps are English
    (fromDb "omny.fm/shows/cool-people-who-did-cool-stuff" // pol)  # Maggie Killjoy -- referenced by Cory Doctorow
    (fromDb "originstories.libsyn.com" // uncat)
    (fromDb "podcast.posttv.com/itunes/post-reports.xml" // pol)
    (fromDb "podcast.thelinuxexp.com" // tech)
    (fromDb "politicalorphanage.libsyn.com" // pol)
    (fromDb "reverseengineering.libsyn.com/rss" // tech)  # UnNamed Reverse Engineering Podcast
    (fromDb "rss.acast.com/deconstructed")  # The Intercept - Deconstructed
    (fromDb "rss.acast.com/ft-tech-tonic" // tech)
    (fromDb "rss.acast.com/intercepted-with-jeremy-scahill")  # The Intercept - Intercepted
    (fromDb "rss.art19.com/60-minutes" // pol)
    (fromDb "rss.art19.com/the-portal" // rat)  # Eric Weinstein
    (fromDb "seattlenice.buzzsprout.com" // pol)
    (fromDb "srslywrong.com" // pol)
    (fromDb "sharkbytes.transistor.fm" // tech)  # Wireshark Podcast o_0
    (fromDb "sscpodcast.libsyn.com" // rat)  # Astral Codex Ten
    (fromDb "talesfromthebridge.buzzsprout.com" // tech)  # Sci-Fi? has Peter Watts; author of No Moods, Ads or Cutesy Fucking Icons (rifters.com)
    (fromDb "techwontsave.us" // pol)  # rec by Cory Doctorow
    # (fromDb "trashfuturepodcast.podbean.com" // pol)  # rec by Cory Doctorow, but way rambly
    (fromDb "wakingup.libsyn.com" // pol)  # Sam Harris
    (fromDb "werenotwrong.fireside.fm" // pol)

    # (fromDb "rss.art19.com/your-welcome" // pol)  # Michael Malice - Your Welcome -- also available here: <https://origin.podcastone.com/podcast?categoryID2=2232>
    # (fromDb "rss.prod.firstlook.media/deconstructed/podcast.rss" // pol)  #< possible URL rot
    # (fromDb "rss.prod.firstlook.media/intercepted/podcast.rss" // pol)  #< possible URL rot
    # (mkPod "https://anchor.fm/s/21bc734/podcast/rss" // pol // infrequent)  # Emerge: making sense of what's next -- <https://www.whatisemerging.com/emergepodcast>
    # (mkPod "https://audioboom.com/channels/5097784.rss" // tech)  # Lateral with Tom Scott
    # (mkPod "https://feeds.megaphone.fm/RUNMED9919162779" // pol // infrequent)  # The Witch Trials of J.K. Rowling: <https://www.thefp.com/witchtrials>
    # (mkPod "https://podcasts.la.utexas.edu/this-is-democracy/feed/podcast/" // pol // weekly)
  ];

  texts = [
    (fromDb "amosbbatto.wordpress.com" // tech)
    (fromDb "applieddivinitystudies.com" // rat)
    (fromDb "artemis.sh" // tech)
    (fromDb "ascii.textfiles.com" // tech)  # Jason Scott
    (fromDb "austinvernon.site" // tech)
    (fromDb "balajis.com" // pol)  # Balaji
    (fromDb "ben-evans.com/benedictevans" // pol)
    (fromDb "bitbashing.io" // tech)
    (fromDb "bitsaboutmoney.com" // uncat)
    (fromDb "blog.danieljanus.pl" // tech)
    (fromDb "blog.dshr.org" // pol)  # David Rosenthal
    (fromDb "blog.jmp.chat" // tech)
    (fromDb "blog.rust-lang.org" // tech)
    (fromDb "blog.thalheim.io" // tech)  # Mic92
    (fromDb "bunniestudios.com" // tech)  # Bunnie Juang
    (fromDb "capitolhillseattle.com" // pol)
    # (fromDb "drewdevault.com" // tech)
    # (fromDb "econlib.org" // pol)
    (fromDb "edwardsnowden.substack.com" // pol // text)
    (fromDb "fasterthanli.me" // tech)
    (fromDb "gwern.net" // rat)
    (fromDb "harihareswara.net" // tech // pol)  # rec by Cory Doctorow
    (fromDb "ianthehenry.com" // tech)
    (fromDb "idiomdrottning.org" // uncat)
    (fromDb "interconnected.org/home/feed" // rat)  # Matt Webb -- engineering-ish, but dreamy
    (fromDb "jeffgeerling.com" // tech)
    (fromDb "jefftk.com" // tech)
    (fromDb "kosmosghost.github.io/index.xml" // tech)
    # (fromDb "lesswrong.com" // rat)
    (fromDb "linmob.net" // tech)
    (fromDb "lwn.net" // tech)
    (fromDb "lynalden.com" // pol)
    (fromDb "mako.cc/copyrighteous" // tech // pol)  # rec by Cory Doctorow
    (fromDb "mg.lol" // tech)
    (fromDb "mindingourway.com" // rat)
    (fromDb "morningbrew.com/feed" // pol)
    (fromDb "overcomingbias.com" // rat)  # Robin Hanson
    (fromDb "palladiummag.com" // uncat)
    (fromDb "philosopher.coach" // rat)  # Peter Saint-Andre -- side project of stpeter.im
    (fromDb "pomeroyb.com" // tech)
    (fromDb "preposterousuniverse.com" // rat)  # Sean Carroll
    (fromDb "profectusmag.com" // uncat)
    (fromDb "project-insanity.org" // tech)  # shared blog by a few NixOS devs, notably onny
    (fromDb "putanumonit.com" // rat)  # mostly dating topics. not advice, or humor, but looking through a social lens
    (fromDb "richardcarrier.info" // rat)
    (fromDb "rifters.com/crawl" // uncat)  # No Moods, Ads or Cutesy Fucking Icons
    (fromDb "righto.com" // tech)  # Ken Shirriff
    (fromDb "rootsofprogress.org" // rat)  # Jason Crawford
    (fromDb "sagacioussuricata.com" // tech)  # ian (Sanctuary)
    (fromDb "semiaccurate.com" // tech)
    (fromDb "sideways-view.com" // rat)  # Paul Christiano
    (fromDb "slimemoldtimemold.com" // rat)
    (fromDb "spectrum.ieee.org" // tech)
    (fromDb "stpeter.im/atom.xml" // pol)
    # (fromDb "theregister.com" // tech)
    (fromDb "thisweek.gnome.org" // tech)
    (fromDb "tuxphones.com" // tech)
    (fromDb "uninsane.org" // tech)
    (fromDb "unintendedconsequenc.es" // rat)
    # (fromDb "vitalik.ca" // tech)  # moved to vitalik.eth.limo
    (fromDb "vitalik.eth.limo" // tech)  # Vitalik Buterin
    (fromDb "webcurious.co.uk" // uncat)
    (fromDb "xn--gckvb8fzb.com" // tech)
    (mkSubstack "astralcodexten" // rat // daily)  # Scott Alexander
    (mkSubstack "byrnehobart" // pol // infrequent)
    # (mkSubstack "doomberg" // tech // weekly)  # articles are all pay-walled
    (mkSubstack "eliqian" // rat // weekly)
    (mkSubstack "oversharing" // pol // daily)
    (mkSubstack "samkriss" // humor // infrequent)
    (mkText "http://benjaminrosshoffman.com/feed" // pol // weekly)
    (mkText "http://boginjr.com/feed" // tech // infrequent)
    (mkText "https://acoup.blog/feed" // rat // weekly)
    (mkText "https://anish.lakhwara.com/home.html" // tech // weekly)
    (mkText "https://forum.merveilles.town/rss.xml" // pol // infrequent)  #quality RSS list here: <https://forum.merveilles.town/thread/57/share-your-rss-feeds%21-6/>
    # (mkText "https://github.com/Kaiteki-Fedi/Kaiteki/commits/master.atom" // tech // infrequent)
    (mkText "https://jvns.ca/atom.xml" // tech // weekly)  # Julia Evans
    (mkText "https://linuxphoneapps.org/blog/atom.xml" // tech // infrequent)
    (mkText "https://nixos.org/blog/announcements-rss.xml" // tech // infrequent)  # more nixos stuff here, but unclear how to subscribe: <https://nixos.org/blog/categories.html>
    (mkText "https://nixos.org/blog/stories-rss.xml" // tech // weekly)
    # (mkText "https://til.simonwillison.net/tils/feed.atom" // tech // weekly)
    (mkText "https://www.bloomberg.com/opinion/authors/ARbTQlRLRjE/matthew-s-levine.rss" // pol // weekly)  # Matt Levine
    (mkText "https://www.stratechery.com/rss" // pol // weekly)  # Ben Thompson
  ];

  videos = [
    (fromDb "youtube.com/@Channel5YouTube" // pol)
    (fromDb "youtube.com/@ColdFusion")
    (fromDb "youtube.com/@ContraPoints" // pol)
    (fromDb "youtube.com/@Exurb1a")
    (fromDb "youtube.com/@hbomberguy")
    (fromDb "youtube.com/@PolyMatter")
    (fromDb "youtube.com/@rossmanngroup" // pol // tech)  # Louis Rossmann
    (fromDb "youtube.com/@TechnologyConnections" // tech)
    (fromDb "youtube.com/@TheB1M")
    (fromDb "youtube.com/@TomScottGo")
    (fromDb "youtube.com/@Vihart")
    (fromDb "youtube.com/@Vox")
    (fromDb "youtube.com/@Vsauce")
  ];

  images = [
    (fromDb "miniature-calendar.com" // img // art // daily)
    (fromDb "pbfcomics.com" // img // humor)
    (fromDb "poorlydrawnlines.com/feed" // img // humor)
    (fromDb "smbc-comics.com" // img // humor)
    (fromDb "turnoff.us" // img // humor)
    (fromDb "xkcd.com" // img // humor)
  ];
in
{
  sane.feeds = texts ++ images ++ podcasts ++ videos;

  assertions = builtins.map
    (p: {
      assertion = p.format or "unknown" == "podcast";
      message = ''${p.url} is not a podcast: ${p.format or "unknown"}'';
    })
    podcasts;
}
