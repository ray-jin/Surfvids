//
//  ListViewController.m
//  videos
//
//  Created by prateek sharma on 03/03/13.
//  Copyright (c) 2013 prateek sharma. All rights reserved.
//

#import "ListViewController.h"
#import "VideoPreviewViewController.h"
#import "AppDelegate.h"

#import "PinInfoCell.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
       self.title=@"SurfVidz Movies";
    
    
    moviesListArray =[[NSArray alloc]initWithObjects:
                      @"Activ8",
                      @"Around the World in 80 Waves",
                      @"Cheyne Horan Learn to Sturf",
                      @"Liquid Time",
                      @"Madmen 93",
                      @"Madmen Saint's and Sinners",
//                      @"Munga Militia",
                      @"Pulse",
                      @"Rad Movez 1",
                      @"Rad Movez 2",
                      @"Ripping Down Walls",
                      @"Sarges Surfing Scrapbook 1",
                      @"Sarges Surfing Scrapbook 2",
                      @"Sarges Surfing Scrapbook 3",
                      @"Sarges Surfing Scrapbook 4",
                      @"Sarges Surfing Scrapbook 5",
                      @"Sarges Surfing Scrapbook 6",
                      @"Sarges Surfing Scrapbook 7",
                      @"Sarges Surfing Scrapbook 8",
                      @"Sarges Surfing Scrapbook 9",
                      @"Scream In Blue",
                      @"Secret Spots On Celluloid",
                      @"Surf Assassins",
                      nil];

    imagesArray =[[NSArray alloc]initWithObjects:@"Activa-8.png",
                  @"Around.jpg",
                  @"learn_to_surf.png",
                  @"Liquid_Time.jpg",
                  @"Madmen.jpg",
                  @"MadmenSaints.jpg",
//                  @"MungaMilitia.jpg",
                  @"Pulse.jpg",
                  @"rad1.png",
                  @"rad2.png",
                  @"RippingDownWalls.jpg",
                  @"Scarap1.png",
                  @"scrap2.png",
                  @"scrap3.png",
                  @"scrap4.png",
                  @"scrap5.png",
                  @"scrap6.png",
                  @"scrap7.png",
                  @"SargesSurfingScrapbook8.jpg",
                  @"SargesSurfingScrapbook9.jpg",
                  @"ScreamInBlue1.png",
                  @"SecretSpotsOnCelluloid.jpg",
                  @"SurfAssassins.jpg",
                  nil];
    
    
    MoviesInfoArray =[[NSArray alloc]initWithObjects:
                      @"Witness Dylan Longbottom's crazy air antics in Indo. The finest Kirra in years with Deano, Margo, Trent Munro, Phil Macca, Jay Phillips and co. Terrifying Tahiti with the worlds elite. See why Occy is 'aging like wine'. Young Aussies charge OTW/Hawaii. Also Featuring, Quicksilver Pro 2002, The Bob, Nathan Hedge, Maz, Pancho, Luke, Josh, Kerr, Kelly, Hoyo, Koby, Willsy, Dorian and many more.\nRelease Date 2002 \nRunning Time 42 mins",
                      
                      @"Around the world in Eighty Waves picks up the action in Sydney Australia highlighting the final ASP event and Damien Hardman's convincing victory. Next its off to tropical Indonesia and a new island discovery \"Sumbuwa\" and back again to Australia for a look at some huge cold water power out west. Halfway around the world spicy Puerto Rico is calling so off we zoom to catch some east coast water barrels. Finally we rush back to Hawaii just in time for possibly the best surfing event ever the 88/89 Billabong Pro with all its drama and surprises.\n\nJeepers Creepers what more could you ask for \"Around the world in 80 waves\" stands and delivers double barrelled surf action that will have you foaming at the mouth. See it now before the end of the world.\n\nStarring Barton Lynch, Tom Curren, Derek Ho, Luke Egan, Damien Hardman, Tom Carroll, Gary Elkerton, Todd Holland, Vatea David, Glen Winton, Martin Potter, Sunny Garcia, Ronnie Burns, and Liam McNamara and introducing Mike McAuliffe.\n\nLocations Sydney Australia, Sumbawa Indonesia, Puerto Rico, Hawaii. 88/89 Billabong Pro.\n\nRunning Time 78 min\n\nRelease Time 1989",

                      @"I am very proud of my DVD on teaching techniques on how to Learn 2 Surf .\n It takes somebody from never having touched a surfboard in their life through all the beginner techniques;\nGetting out in the surf Riding waves with control to the beach Surfing etiquette Surf safety Reading the waves Rips and how to get out of the rip while swimming\nFor Surfshops this is an important product to sell I believe, as it is part of the stores duty of care to the board riding beginners. I mean that if they are selling boards and equipment to starter surfers then they need to give them the right start with all the knowledge and safety in this DVD.\n Also parents should think about my Learn 2 Surf DVD for their kids, whether they surf or not or are someone that knows very little about surfing I would consider the DVD as it has over 25 years of me teaching beginners how to surf safely and wisely.\nYou will see the demonstrations done on land and in still water and then in the surf. You can do these techniques the same way and they will work for you. I teach beginners everyday of the year (except when I'm chasing waves overseas) and this is what I teach them.\nTo come to Surfers Paradise and learn all of this would cost you over $500 in lessons but if you get this DVD you get it all for A$44.95, (US$47.00). To all the surfing coaches who I have watched and been involved with in surf coaching all around world since 1978 I guarantee you will have alot more to teach your students or budding surfers from this DVD, that is the reaction from all the coaches who have viewed it!\nThere is also a profile on myself as World Champion and riding some of the biggest days ever in surfing , that is waves over 60ft.\nAs I said I'm proud of this DVD and think it hits the bulls eye for beginners.\nHave a Good Surf!\n\nCheyne",
                      
                      @"Welcome to another world, a place where perfect waves peel endlessly down flawless sandspits and off around the kind of points surfers have only ever dreamt. It's time for your imagination to be set free. Liquid Time.\n\nMonty Webbersnew movie,Liquid Time, features perfect, backlit, tubing waves peeling endlessly down perfect points and sandbars, with plenty of in-the-barrel shots in the style of George Greenough. But no surfer will ever ride them - these are mini waves, created in still water by boat wake.\nIn his staggering, mesmerizing film, Australian Monty Webber reveals that the world's most perfect waves are only five inches high.\n\nThe effect - slowed down, so it looks, in scale like real time and set to the music of Tim Love Lee, Rosie Westbrook, The Hunchbacks and Bourbon St is mesmerising. Webber has used his vivid imagination to take you somewhere else and this is probably destined for cult status among surfers and non-surfers alike.\n\nAlso includes 20 minutes of white hot surfing by Mick Fanning, Taj, Kelly, Wink, Walt, Willsy and Daniel Ross. Plus the best ofMonty's movie,RISE - featuring Trent, Mick, Joel, Rast and Michael Peterson.",

                      
                      @"Featuring the 30 most explosive surfers on the planet today in our mind boggling display of non-stop carving catch all the action from the Gold Coast classic points to the raw power of Western Australia heaviest Reefbreak.\n\nFor the first time ever see Kelly Slaters meteoric charge to his first world title is followed closely by a new generation of rippers putting their lives on online this past winter in Hawaii\n\nSurfers Matt Archibald, Kelly Slater, Shane Dorian, Johnny Boy Gomes, Ross Williams, Sunny Garcia, Shane Herring, Shane Beschen, Tom Curren, Shane Powell, Taylor Knox, Chris Brown, Sean Briley, Tom Carroll, Martin Potter, David Gonzales\n\nRunning Time 60 minutes\n\nChris Brystrom Films 1993",

                      
                      @"The epic Hawaiin Winter of 91/92 will go down in surfing history as a vintage year for waves. Blasting onto pro surfing's scene come's the amazing Kelly Slater with his mind blowing assault . Plus all of the insane new moves by Pipes undisputed champion Tom Carroll. With fresh from the front line action of Johnny Boy Gomes, Luke Egan and surfing's ultimate bad boy Liam McNamarra . Plus the ariel attack of California's Christian Fletcher and Matt Archbold.\n\nMadmen Saint's and Sinner's is the ultimate hard core surf film with dripping wet water footage by Hawaii's # 1ocean cameraman - Derek Hoffman.\n\nSee all of the action as you like it, up close & in focus and check out surfing's most crazed individual's risking life and limb to rocket surfing into the next realm.\n\nSurfers Tom Carroll, Liam McNamarra Tom Curren, Kelly Slater Matt Archbold, Christian Fletcher, Derek & Michael Ho, Dane Kealoha, David Gonsolves, Jay Adams, Luke Egan\n\nRunning Time 60 mins\n\nRelease Time 1992",

//                      @"Kick back and enjoy Munga, Occy, Hoyo, Egan and his mates tear the bag off it from mindless Kirra to perfect Jbay the boys are going up side down and getting radically deep. Join Munga for a tour of his home breaks deep in the heart of Surfers Paradise as four cyclones in Queensland this year make this some of the most radical surfing you're likely to see all this set to the cool tunes of the Suicidal Tendencies the Lime Spiders Killing Time and the Hell Man make Munga Militia the first surf movie you can mosh to so crank up the volume for 30 minutes of surf and slam if this don't get you pumped to go and destroy a couple of lips nothing will.\n\nMusic Suicidal Tendencies, Killing Time, Lime Spiders\n\nRunning Time 30 min\n\nRelease Date 1992",

                      
                      @"Watch some of the hottest freesurfing with some of Australia's newest talent to come on stage and come watch them tear up waves in Australia with some exceptional aerial surfing and also some hard gauging by none other then the legend Mark Occhilupo\nJustin was in exactly the right place at the right time to show the worlda great surfing generation just as it came of age.\nThese were sandy footed grommets who've since become international surfing superstars, and for many of 'em, PULSE was their first big step down that path.In the days when the American New School still ruled the roost, PULSE turned everyone's ideas about Aussie surfing on their heads…\nWe weren't a done deal, we hadn't even started! and if you missed it the first time around, then don't miss it now.\nSurfers Margo, Occy, Joel Parkinson, Rasta, Neal Purchase, Dean Morrison, Trent Munro, Simon Robinson, Will Lewis, Taj Burrow, Jay Phillips, Beau Emmerton, China, Lee Winkler, Mike Rommelse, Shane Wehner, Guy Walker, Damon Nicholls, Munga\n\nLocation  Hawaii, Australia, Indonesia\n\n\nRelease Date 1996\nRunning Time 50 min",

                      @"Glen Winton takes us behind the scenes with season 90/91 with the ASP Tours elite surfers with contest highlights and around the contests free surfing sessions bringing us an exciting view of the radical surfing that was being brought into the 90s and also for the first time seeing the new World Champion Kelly Slater taking it to the top 44 and showing them all that surfing was about to change.\nA fast paced video featuring the most radical maneuvers and it also has the best surfers like Tom Carroll, Martin Potter, and more and you can be guaranteed that you will want to watch it again.\nSurfers Tom Carroll, Kelly Slater, Cheyne Horan, Derek Ho, Glen Winton, Dino Andino, Martin Potter, Gary Elkerton, Munga, Tony Ray, Luke Egan, Matt Hoy, plus many more\nMusic Savage Heart, Ratbag, Calibre, Junkmale, Rustique & N.P.L\nRunning Time 40 mins\nRelease Date 1991",

                      @"Glen Winton once again takes us behind the scenes with season 91/92 with the ASP Tours elite surfers with contest highlights and around the contests free surfing sessions bringing us an exciting view of the radical surfing that was being brought into the 90s and also for the first time seeing the new World Champion Kelly Slater taking it to the top 44 and showing them all that surfing was about to change and finally taking the world title in Brazil with one WCT left to go and Slater had now sent shock to the surfing world that his new brand of surfing was going to change competition forever\nSurfers Tom Carroll, Kelly Slater, Cheyne Horan, Derek Ho, Glen Winton, Dino Andino, Martin Potter, Gary Elkerton, Munga, Tony Ray, Luke Egan, Matt Hoy, plus many more\nMusic Mission From Dog, Guttersnipes, The Children, The Damn Nation, The Calhoons\nRunning Time 35 mins\nRelease Date 1992",

                      @"Hot of the presses comes \"Ripping Down Walls\" the latest and the greatest surf epic from the maker of \"Freeze Frame\" and Blazing Boards\"\n\nCheck out Munga Barry and Jason Buttenshaw riding the biggest waves of the year at Killer Kirra. Gasp as Occy and Ando lacerate each crystal section laying down the heaviest moves imaginable. And watch Cheyne Horan's comeback of the decade as he lays waste to surfing's big guns on his amazing re entry to the top 16\n\nAll over the world he barriers are tumbling down and surfing in the 1990's is no different. From Pipeline to Bells to Kirra's infamous 16 million dollar wave see all of the action from an absolute epic year of surfing.\n\nRelease Date 1990\n\nRunning Time 67 mins",
                      
                      @"The session belonged to the man with the tree stump legs as Tom took off and tucked in pigdog fully upright and charged the keyhole at the end of the filthy right trimming his board continuously and spent half of the ride high on the wall and it was filth and probably the most used phrase in France is Im not going out tonight is also the biggest lie.\nHossegor is probably about as close as you come to the North Shore of Ohau with an incredible diverse range of quality set ups can be had over about 3 or 4 kilometres and it was hot and sunny everyday and there were nude chicks everywhere and undoubtedly the best heat of the round was between Kelly Slater and Nikky Wood.\nThese are the quotes from Paul Sargent and on tour Sarge has been a profile recorder of the top surfers in the world slugging it out around the world.\nIn this video Sarge with the assistance from a handful of surfers will give us an insight into the pro world tour and the waves outside the contest arena and it is the first of four such productions and the quality of the camera work is good and the waves and music only stop pumping for humorous commentary from surfing's master of the dance floor and tube John Shimooka\nYou will witness to the only video to have Margaret River at 20 to 25 feet November 1990 and this movie starts at Oceanside Beach in California onto the OP Pro then to Europe with France, Spain and Portugal.\nSurfers Tom Curren, Tom Carroll, Kely Slater, Martin Potter, Brad Gerlach, Matt Branson, Jeremy Byles, Mark Occilupo, Matt Archbold\nSarges Surfing Scrapbook Films 1990\n Running Time: 60 mins",
                      
                      @"Dont wait ages to see the worlds best high performance surfers doing there darndest on the pro circuit or freesurfing or doing there best to have fun. Its all there for you right now on Sarges Surfing Scrapbook and you can check out the latest action from last winter on the North Shore where Tom Carroll puts on his helmet in more heavier places then a business man in Bangkok and watch Nikki Wood get rich surfing sunset and you can catch all of the nasty moves in the water and behind close doors.\nTheres also plenty of action from Australia  featuring Brazilian surfer Flavio Padaratz surfing with the speed of Ayrton Senna on the mid north coast and also a raging crew in Western Australia and a complete wrap on the recent ASP aussie leg as it includes the perfect 4 to 6 foot day at Queenscliff for the Drug Offensive Clearwater Classic plus the Rip Curl Pro at Bells plus 13th beach and Easter Reef at 18 feet with Martin Potter, Tom Carroll and crew and then its back to Sydney for the Coca Cola Classic at Narrabeen.\nSarges Surfing Scrapbook should even make your granny wax up and go for a surf as this movie is better then Jaws and Blue Lagoon.\nSurfers Tom Curren, Tom Carroll, Kelly Slater, Martin Potter, Brad Gerlach, Matt Branson, Mark Occhilupo, John Shimooka, Gary Elkerton, Rob Bain, Shane Powell, Damien Hardman\nSarges Surfing Scrapbook Films 1991\nRunning Time: 117 mins",
                      
                      @"Sarges three is definitly the best yet and a must not been missed video. Recorded in cointreau vision see all of the highs and lows from fun places like Timor, South Africa and France, and see the things we do to amuse our mates in aeroplanes and also watch Brad Gerlach assault Richard (DOG) Marsh and slam him in a car boot and also bunging jumping over land, gag fights, drinking and other naughty activities.\nThis flick has the lot and most of all witness the latest state of the art surfing from legends young and old such as Tom Carroll, Tom Curren, Brad Gerlach, Shane Powell, Shane Herring and some bloke called Slater. Sarges take three is not a video for dorks or the faint hearted and with the latest underground music.\nSurfers Tom Curren, Tom Carroll, Kelly Slater, Martin Potter, Brad Gerlach, Matt Branson, Jeremy Byles, Mark Occhilupo, Matt Archbold\nSarges Surfing Scrapbook Films 1990\nRunning Time: 60 mins\nMusic\nAgent One\nPopcorn Explosion\nSweatin Bullet\nHellme\nHeadache\nDef Fx",
                      
                      @"In the age of modern video it is refreshing to see something so imediate and so up to date that wins the viewer over into the real fantasy world of the world circuit professionals and so sit back with a heavy soundtrack.\n1992 if you wernt there at least you get a glimpse of some of the worlds best surfers shralping and shredding and dancing all over our planet which includes Hawaii, Japan cyclone, Australia blitzing and going off.\nSurfers Tom Curren, Tom Carroll, Kelly Slater, Martin Potter, Brad Gerlach, Matt Branson, Mark Occhilupo, John Shimooka, Gary Elkerton, Rob Bain, Shane Powell, Damien Hardman, Glen Winton, Derek Ho, Sunny Garcia\nSarges Surfing Scrapbook Films 1992\nRunning Time: 60 mins\nMusic\nTunnelvision,\nThe Nocturnes,\nThis Thing,\nSummerhouse,\nSepultura,\nUnloved,\nFridge,\nAgent One,\nSugarshack",
                      
                      @"Yes Sarge is back with footage of the most exciting ASP tour to date as we see this years emergence of Kelly Slater rising to the top of the world tour ratings. We start off in France with Tony Ray taking out Slater at the Lacanau event and  then off to Hossegor for the Rip Curl Pro and we watch as Slater takes his virgin ASP World Tour event taking out Elko in very tricky conditions. Onto Biarritz for the Quiksilver Pro were unfortunately the event was called off at the quarterfinals due to lack of surf but there was plenty off hot surfing in the small conditions leading up to the quarter finals.\n\nThen onto South Africa where we take an off road trip with Munga and Powelly for some free surfing sessions along the South African coastline.\n\nThen onto the South African leg of the tour where we see Sunny Garcia reveling in the small conditions and taking out the Gunston event pushing him closing in the world title race against Slater and then off to the Reunion Island event where the ASP scores 6 to 8 feet perfect Reunion Island waves and the ASP top 44 unleashes there talent on some incredible waves and with the eventual winner Dog Marsh taking out the winners trophy.\n\nThen off to Hawaii for the triple crown of surfing as we see Sunny Garcia taking out the Haleiwa Pro in solid conditions and then off to the Pipe Masters where Slater takes his second ASP Tour Win narrowly beating Sunny Garcia in the final in storm like conditions at Pipeline.\n\nThen we head over to Brazil for the Alternativa Pro where we see Kelly Slater claim his first ASP World Tour championship as he secures enough points during the event to claim the World Title. Damien Hardman is the event winner in small mushy beach break conditions but the Brazilian event sees the end of the World Tour title race.\n\nWe wrap the movie up with some free surfing at Queenslands Gold Coast and the Billabong Kirra Pro with Martin Potter taking out the event in excellent conditions and then off to the margerat River event where we see Elko take out the event in very tricky storm like conditions and then off to Bells where the event had to be eventually be moved to Johanna where the ASP Top 44 score incredible perfect waves and with Damien Hardman beating Barton Lynch in the final with some of the best surfing for the 93 season.\n\nOff to the Coke in Sydney where the ASP hit miniature like conditions but the Top 44 still surfed hard with Todd Holland beating Vetea David in the final.\n\nWe finish take 5 off with some hot free surfing from all over the place with Shane Herring Slater and Dog Marsh taking the waves to pieces.\n\nMusic:    Damn Nation (Looking For Some Action) Occy and Brian Springbok (Black Magic Women) No Return (Shadow Of The Night) Sugar Shack (I Got A Shovel ill Heap You Dig) Story Time (Glass Butterfly) Summerhouse (Presidential Glades) Presto (Area of the Possible) Frozen Doberman (Dying Phase) The Meanies (Never) Circle Of Fate (Bimbo) Nocturnes (Mercenary Presidente) Juice (Movin On) The Meanies (Dr Seuss)\n\nRunning Time 58 Minutes\n\nRelease Date 1993",
                      
                      @"Sarge is back again and in this movie we kick off with the beginning of the ASP 93 season with France for the Lacanau, Hossegor, and Biarritz with some really hot free surfing and competition surfing. We will also be going to Spain, Portugal, Japan, Hawaii, and back for the Australian events for the beginning of the 94 season.\n\nIn take 6 we score some epic waves at Manduka with Ross Clark Jones taking Manduka to pieces and grabbing some insane barrels. Also check out some grew free surfing at Haleiwa and Sunset by Cheyne Horan and Shane Powell.\n\nTake 6 finishes off in Australia for one of the most epic swells at Kirra and Bells with both venues pumping in 6 to 8 feet perfect waves with Slater and Garcia winning at both events.\n\nSo sit back and enjoy the best of Sarges Take 6\n\nMusic   Not So Sweet (The Kid), Not So Sweet (Pages Of Mind), Tim Johnston (Revelation), Frotn End Loader (All Star Jam), Dead Flowers(Someday), Roddy Ray Da and the Surfing Ceasers (Midnight Moses), Infectious Grooves (Three Headed Mind Pollution) No Comply (Smile)\n\nRelease Date 1994\n\nRunning Time 50 minutes",
                      
                      @"Yep take 7 already and get the best and latest action, attitude and antics from around the globe right here. We settle in with Occy, Margo, Munga and Craig Holley having fun on the gold coast before moving onto Brazil for the world amateur championships. Check the commitment as the Brazilians push the Aussies all the way. Then over the indian ocean and witness Luke Egan and Rob Machado taking the St Leu lefts apart in Reunion Island before the ASP circus arrives. Try and keep up with the pace and peculiarities of the Huntington Beach as the world championship tour event returns to California. Get the hype of Slaters incredible last wave and Shane Beschens skill and drive to take the US Open trophy. Experience the unique culture of the Australian aboriginals as they tuck into Aussie Pipe. Savour the luscious wenches and along spiralling pits of Hossegor in France and the pros go off in their justified favourite port of call and finish with our psyche session with sick moves from all over. This movie is guaranteed to get you wet (the salty kind) so kick back and enjoy.\nSarges Surfing Scrapbook Films 1997\nRunning time 40 minutes\nMusic\nFireballs\nDon't Bother Me\nMassappeal\nIn The Out There Place\nHoss\nSuperbo\nThe Bearded Clams\nMirror Reflection\nThe Wash\nPsychopomp Nemesis\nDeadheart\nFlag\nInfectious Grooves\nViolent and Funky\nParkside Killers\nJack Move",
                      
                      @"Coke 94: The last event of the 1994 Coca Cola ASP WCT circuit and the worlds best go down to Avoca's Shane Powell in punchy North Narrabeen lefts.\n\nHB/O&E Pro Junior: More Narrabeen mayhem as the groms go berko in pursuit of the victors trophy for the worlds original pro event. See favourite Kalani Robb fall to Beau Emerton and then get introduced to some raw and raucous Aussie social habits.\n\nHawaii: The smallest season in years as the wyland and the Hapuna World Cup suffer in shoulder high waves. The tour crew still take it apart through only using a fraction of there prepared quivers.\n\nTales of Two Coastlines: Filthy surfing and deadset waves with grunt from both sides of the Australian continent. Check Pottz at Whaley beach, Herring and Slater at \"The Point\" and then lose a bit of breath as the West Oz crew and a few blow ins take on a serious.\n\nPapua New Guinea: Yep theres waves up there and heaps of potential, virtually untapped. Mike Rommelse, Ces Wilson and Rob Bain pull in some classic reef set ups and dodge kids trying to surf fence palings. One to catch your breath on a cruise.\n\nHawaii 2: Some nearly decent pipe and the valiant attempts to make something of it in the first round of the Chiemsee 1994 Pipe Masters. Some nasty, crunching,fast critical pits elsewhere, and something to laugh at.\n\nThe 95 Aussie WQS leg: Action across the country including Burleigh Heads, Mooloolaba, Duranbah, Newcastle and Margaret River. Its a collage of new and old faces and moves. Spot the spot.\n\nDing Dong 95: The annual festival of surfing at Bells Beach in Victoria. Sunny Garcia takes the opening WCT event of the season with lightning accuracy and agility.\n\nG-Land (1): The worlds best contest ever, the Quiksilver Pro, is blessed with perfect overhead G-Land barrels of bliss. The worlds top 44, and a few friends, ride the place en masse like it has never been ridden before. You don't even know.\n\nG-Land (2): More of the same. Just join off what more can we say. The music is hardcore as the surfing.\n\nMusic  The Egg, Parkside Killers, Deadheart, Biohazard, Telek Not Drowning Waving, Shihad, Dirtbone, Cosmic Psychoses, Faceplant, Sepultura,\n\nRunning Time 56 mins\n\nRelease Date 1995",

                      
                      @"Sarge is back and your back on tour traveling the globe in search of waves and rating points with the worlds top ASP rated surfers. Taking up where Take 8 left off some five years ago, Sarge continues his intimate coverage of the pro surfing scene with all the action and real life behind the scenes footage on offer. See why the top 44 are called just that. The boys are ripping.\n\nMusic  Stark (Rock 'N Roll Is Devils Music) Unusual Addiction (Love Follow Me)  Mattie O (Ultimatz) Unusual Addiction (LMB) 39 Short (Overlapse) Sepultura (Tribus) Unusual Addiction (Judgment Seat) 4 Bolt (Secret Highway) Sunchild (Take It Down) Unusual Addiction (Im No Superman)\n\nRunning Time 62 mins\n\nRelease Date 2000",

                      
                      @"This movie covers the tumultuous period in pro surfing when Tom Curren won his first world title and the sport struggled for it's identity after finally getting some mainstream exposure. It is also an account of the personal journey of Cheyne Horan through the rigours of the world pro surfing tour and his spiritual questing.\nThe movie captures the feelings and energy of a special time in surfings rich history.\nProduced by Cheyne Horan\nStarring Tom Carroll, Tom Curren, Barton Lynch, Mark Richards, Michael Ho, Derek Ho, Mark Occhilupo, Damien Hardman, Brad Gerlach, Rabbit Bartholomew, Nicky Wood and Cheyne Horan.\nMusic by Midnight Oil, INXS, Machinations, Gangajang and additional compositions by Anthony Partos.\nCover art by Jim Davidson\nConceived, written and directed by Kerry Bindon, ©1987\nDuration 75 minutes Rated PGR (Parental Guidance Recommended)",
                      
                      
                      @"Just when you thought you'd seen it all comes \"Secret Spots On Celluloid\". A no hold's barred trek to find the ultimate, secluded dream waves. Plus absolute up to the minute coverage of Tom Curren meteoric return to domination in this years ASP world surfing tour.\n\nEven in the wild wooly 1990's its possible to find perfect unridden waves. Join Greg Anderson and George Hulse on an epic three day adventure to a classic virgin reef break.\n\nFollow Shane Powell as he lacerates the seldom ridden reefs and sandbars of Australia's Central coast and discover the ultimate Hawaiin dream wave.\n\nOnly \"Secret Spots On Celluloid\" dares to feature Mike STewart and the worlds greatest bodyboarder's going head to head at the worlds most dangerous break. Nonstop commercial free action with the hottest surf soundtrack ever recorded.\n\nSurfers  Tom Curren, Johnny Boy Gomes, Shaun Munro, Glen Winton, Carwyn Williams Greg Anderson, George Hulse, Vetea David, Damien Hardman, MArtin Potter, Tom Carroll, Liam McNamara, Mike Stewart plus the worlds best body boarders and introducing Shane Powell.\n\nRelease Date 1990\n\nRunning Time 70 Mins",
                      
                      @"From the master of mindless mayhem comes Surf Assassins featuring all new footage from around Australia and the Hawaiian islands. See why the new breed of surfing lions has shattered all of the myths. What was once thought impossible becomes reality as the 1990's annihilate all past limitations.\n\nWatch in awe as the most classic point surf ever filmed Down Under roars into reality and see Poto, Flavio and Carwyn Williams prove once and for all the rest of the world rips too.\n\nWake Up. This here's the truth Ruth \"Surf Assassins\" lays it on the line with a close examination of todays high powered surfing scene. Gape at Gary Elkerton's Triple Crown winning mastery at Sunset Beach plus so much more filmed entirely in 16mm living colour.\n\nSurfer's Gary Elkerton, Vetea David, Mark Occhilupo, Todd Holland, Flavio Padaratz, Carwyn Williams, Richie Collins, Glen Winton, Tony Moniz, Dane Kealoha, Greg Anderson, Lisa Anderson and introducing Josh Lock and Niel Purchase Jnr.\n\nRunning Time 65 mins\n\nRelease Date 1990",
                      
                      nil];
                                                                                                                                                                                                
                                                                                                                                                    
                                                                                                                                                                                                                          
    
    NSArray *movie1 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Activ8/Activ8_part1.mov",
                      @"http://surfvidz.com/Main Movie Folder/Activ8/Activ8_part2.mov",
                      @"http://surfvidz.com/Main Movie Folder/Activ8/Activ8_part3.mov",
                      @"http://surfvidz.com/Main Movie Folder/Activ8/Activ8_part4.mov",
                      @"http://surfvidz.com/Main Movie Folder/Activ8/Activ8_part5.mov"
                      , nil];
    NSArray *movie2 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Around The World In 80 Waves/Around the World In 80 Waves_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Around The World In 80 Waves/Around the World In 80 Waves_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Around The World In 80 Waves/Around the World In 80 Waves_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Around The World In 80 Waves/Around the World In 80 Waves_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Around The World In 80 Waves/Around the World In 80 Waves_part5.mov",
                       @"http://surfvidz.com/Main Movie Folder/Around The World In 80 Waves/Around the World In 80 Waves_part6.mov",
                       @"http://surfvidz.com/Main Movie Folder/Around The World In 80 Waves/Around the World In 80 Waves_part7.mov",
                       @"http://surfvidz.com/Main Movie Folder/Around The World In 80 Waves/Around the World In 80 Waves_part8.mov",
                       nil];
    NSArray *movie3 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Cheyne Horan Learn To Surf/Cheyne Horan Learn To Surf_part1.mov",
                      @"http://surfvidz.com/Main Movie Folder/Cheyne Horan Learn To Surf/Cheyne Horan Learn To Surf_part2.mov",
                      @"http://surfvidz.com/Main Movie Folder/Cheyne Horan Learn To Surf/Cheyne Horan Learn To Surf_part3.mov",
                      @"http://surfvidz.com/Main Movie Folder/Cheyne Horan Learn To Surf/Cheyne Horan Learn To Surf_part4.mov",
                      @"http://surfvidz.com/Main Movie Folder/Cheyne Horan Learn To Surf/Cheyne Horan Learn To Surf_part5.mov",
                      @"http://surfvidz.com/Main Movie Folder/Cheyne Horan Learn To Surf/Cheyne Horan Learn To Surf_part6.mov",
                      @"http://surfvidz.com/Main Movie Folder/Cheyne Horan Learn To Surf/Cheyne Horan Learn To Surf_part7.mov",
                      @"http://surfvidz.com/Main Movie Folder/Cheyne Horan Learn To Surf/Cheyne Horan Learn To Surf_part8.mov",
                      @"http://surfvidz.com/Main Movie Folder/Cheyne Horan Learn To Surf/Cheyne Horan Learn To Surf_part9.mov"
                      , nil];
    NSArray *movie4 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Liquid Time/Liquid Time_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Liquid Time/Liquid Time_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Liquid Time/Liquid Time_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Liquid Time/Liquid Time_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Liquid Time/Liquid Time_part5.mov",
                       @"http://surfvidz.com/Main Movie Folder/Liquid Time/Liquid Time_part6.mov",
                       nil];
    NSArray *movie5 =[[NSArray alloc]initWithObjects: @"http://surfvidz.com/Main Movie Folder/Madmen 93/Madmen 93_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Madmen 93/Madmen 93_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Madmen 93/Madmen 93_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Madmen 93/Madmen 93_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Madmen 93/Madmen 93_part5.mov",
                       @"http://surfvidz.com/Main Movie Folder/Madmen 93/Madmen 93_part6.mov",
                       @"http://surfvidz.com/Main Movie Folder/Madmen 93/Madmen 93_part7.mov",
                       nil];
    NSArray *movie6 =[[NSArray alloc]initWithObjects: @"http://surfvidz.com/Main Movie Folder/Madmen Saint's And Sinner's/Madmen Saints And Sinners_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Madmen Saint's And Sinner's/Madmen Saints And Sinners_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Madmen Saint's And Sinner's/Madmen Saints And Sinners_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Madmen Saint's And Sinner's/Madmen Saints And Sinners_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Madmen Saint's And Sinner's/Madmen Saints And Sinners_part5.mov",
                       @"http://surfvidz.com/Main Movie Folder/Madmen Saint's And Sinner's/Madmen Saints And Sinners_part6.mov",
                       nil];
    NSArray *movie7 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Munga Militia/Munga Militia_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Around The World In 80 Waves/Munga Militia/Munga Militia_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Around The World In 80 Waves/Munga Militia/Munga Militia_part3.mov",
                       nil];
    NSArray *movie8 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Pulse 1/Pulse_part1.mov",
                      @"http://surfvidz.com/Main Movie Folder/Pulse 1/Pulse_part2.mov",
                      @"http://surfvidz.com/Main Movie Folder/Pulse 1/Pulse_part3.mov",
                      @"http://surfvidz.com/Main Movie Folder/Pulse 1/Pulse_part4.mov",
                      @"http://surfvidz.com/Main Movie Folder/Pulse 1/Pulse_part5.mov",
                      @"http://surfvidz.com/Main Movie Folder/Pulse 1/Pulse_part6.mov",
                      nil];
    NSArray *movie9 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Rad Movez 1/Rad Movz 1_part1.mov",
                      @"http://surfvidz.com/Main Movie Folder/Rad Movez 1/Rad Movz 1_part2.mov",
                      @"http://surfvidz.com/Main Movie Folder/Rad Movez 1/Rad Movz 1_part3.mov",
                      @"http://surfvidz.com/Main Movie Folder/Rad Movez 1/Rad Movz 1_part4.mov", nil];
    NSArray *movie10 =[[NSArray alloc]initWithObjects: @"http://surfvidz.com/Main Movie Folder/Rad Movez 2/Rad Movz 2_part1.mov",
                      @"http://surfvidz.com/Main Movie Folder/Rad Movez 2/Rad Movz 2_part2.mov",
                      @"http://surfvidz.com/Main Movie Folder/Rad Movez 2/Rad Movz 2_part3.mov",
                      @"http://surfvidz.com/Main Movie Folder/Rad Movez 2/Rad Movz 2_part4.mov", nil];
    NSArray *movie11 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Ripping Down The Walls/Ripping Down The Walls_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Ripping Down The Walls/Ripping Down The Walls_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Ripping Down The Walls/Ripping Down The Walls_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Ripping Down The Walls/Ripping Down The Walls_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Ripping Down The Walls/Ripping Down The Walls_part5.mov",
                       @"http://surfvidz.com/Main Movie Folder/Ripping Down The Walls/Ripping Down The Walls_part6.mov",
                       @"http://surfvidz.com/Main Movie Folder/Ripping Down The Walls/Ripping Down The Walls_part7.mov",
                       nil];
    NSArray *movie12 =[[NSArray alloc]initWithObjects: @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 1/Sarges Surfing Scrapbook 1_part1.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 1/Sarges Surfing Scrapbook 1_part2.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 1/Sarges Surfing Scrapbook 1_part3.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 1/Sarges Surfing Scrapbook 1_part4.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 1/Sarges Surfing Scrapbook 1_part5.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 1/Sarges Surfing Scrapbook 1_part6.mov", nil];
    NSArray *movie13 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 2/Sarges Surfing Scrapbook 2_part1.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 2/Sarges Surfing Scrapbook 2_part2.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 2/Sarges Surfing Scrapbook 2_part3.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 2/Sarges Surfing Scrapbook 2_part4.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 2/Sarges Surfing Scrapbook 2_part5.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 2/Sarges Surfing Scrapbook 2_part6.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 2/Sarges Surfing Scrapbook 2_part7.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 2/Sarges Surfing Scrapbook 2_part8.mov", nil];
    NSArray *movie14 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 3/Sarges Surfing Scrapbook 3_part1.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 3/Sarges Surfing Scrapbook 3_part2.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 3/Sarges Surfing Scrapbook 3_part3.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 3/Sarges Surfing Scrapbook 3_part4.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 3/Sarges Surfing Scrapbook 3_part5.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 3/Sarges Surfing Scrapbook 3_part6.mov", nil];
    NSArray *movie15 =[[NSArray alloc]initWithObjects:  @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 4/Sarges Surfing Scrapbook 4_part1.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 4/Sarges Surfing Scrapbook 4_part2.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 4/Sarges Surfing Scrapbook 4_part3.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 4/Sarges Surfing Scrapbook 4_part4.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 4/Sarges Surfing Scrapbook 4_part5.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 4/Sarges Surfing Scrapbook 4_part6.mov",
                      @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 4/Sarges Surfing Scrapbook 4_part7.mov"
                      , nil];
    NSArray *movie16 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 5/Sarges Surfing Scrapbook 5_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 5/Sarges Surfing Scrapbook 5_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 5/Sarges Surfing Scrapbook 5_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 5/Sarges Surfing Scrapbook 5_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 5/Sarges Surfing Scrapbook 5_part5.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 5/Sarges Surfing Scrapbook 5_part6.mov", nil];
    NSArray *movie17 =[[NSArray alloc]initWithObjects: @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 6/Sarges Surfing Scrapbook 6_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 6/Sarges Surfing Scrapbook 6_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 6/Sarges Surfing Scrapbook 6_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 6/Sarges Surfing Scrapbook 6_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 6/Sarges Surfing Scrapbook 6_part5.mov", nil];
    NSArray *movie18 =[[NSArray alloc]initWithObjects: @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 7/Sarges Surfing Scrapbook 7_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 7/Sarges Surfing Scrapbook 7_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 7/Sarges Surfing Scrapbook 7_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 7/Sarges Surfing Scrapbook 7_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 7/Sarges Surfing Scrapbook 7_part5.mov", nil];
    NSArray *movie19 =[[NSArray alloc]initWithObjects: @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 8/Sarges Surfing Scrapbook 8_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 8/Sarges Surfing Scrapbook 8_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 8/Sarges Surfing Scrapbook 8_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 8/Sarges Surfing Scrapbook 8_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 8/Sarges Surfing Scrapbook 8_part5.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 8/Sarges Surfing Scrapbook 8_part6.mov",
                       nil];
    NSArray *movie20 =[[NSArray alloc]initWithObjects: @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 9/Sarges Surfing Scrapbook 9_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 9/Sarges Surfing Scrapbook 9_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 9/Sarges Surfing Scrapbook 9_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 9/Sarges Surfing Scrapbook 9_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 9/Sarges Surfing Scrapbook 9_part5.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 9/Sarges Surfing Scrapbook 9_part6.mov",
                       @"http://surfvidz.com/Main Movie Folder/Sarges Surfing Scrapbook 9/Sarges Surfing Scrapbook 9_part7.mov",
                       nil];
    NSArray *movie21 =[[NSArray alloc]initWithObjects:@"http://surfvidz.com/Main Movie Folder/Scream In Blue/Scream In Blue_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Scream In Blue/Scream In Blue_part10.mov",
                       @"http://surfvidz.com/Main Movie Folder/Scream In Blue/Scream In Blue_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Scream In Blue/Scream In Blue_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Scream In Blue/Scream In Blue_part5.mov",
                       @"http://surfvidz.com/Main Movie Folder/Scream In Blue/Scream In Blue_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Scream In Blue/Scream In Blue_part7.mov",
                       @"http://surfvidz.com/Main Movie Folder/Scream In Blue/Scream In Blue_part6.mov",
                       @"http://surfvidz.com/Main Movie Folder/Scream In Blue/Scream In Blue_part8.mov",
                       @"http://surfvidz.com/Main Movie Folder/Scream In Blue/Scream In Blue_part11.mov",
                       @"http://surfvidz.com/Main Movie Folder/Scream In Blue/Scream In Blue_part9.mov",
                       nil];
    NSArray *movie22 =[[NSArray alloc]initWithObjects: @"http://surfvidz.com/Main Movie Folder/Secret Spots On Celluloid/Secret Spots On Celluloid_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Secret Spots On Celluloid/Secret Spots On Celluloid_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Secret Spots On Celluloid/Secret Spots On Celluloid_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Secret Spots On Celluloid/Secret Spots On Celluloid_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Secret Spots On Celluloid/Secret Spots On Celluloid_part5.mov",
                       @"http://surfvidz.com/Main Movie Folder/Secret Spots On Celluloid/Secret Spots On Celluloid_part6.mov",
                       @"http://surfvidz.com/Main Movie Folder/Secret Spots On Celluloid/Secret Spots On Celluloid_part7.mov",
                       @"http://surfvidz.com/Main Movie Folder/Secret Spots On Celluloid/Secret Spots On Celluloid_part8.mov",
                       nil];
    NSArray *movie23 =[[NSArray alloc]initWithObjects: @"http://surfvidz.com/Main Movie Folder/Surf Assassins/Surf Assassins_part1.mov",
                       @"http://surfvidz.com/Main Movie Folder/Surf Assassins/Surf Assassins_part2.mov",
                       @"http://surfvidz.com/Main Movie Folder/Surf Assassins/Surf Assassins_part3.mov",
                       @"http://surfvidz.com/Main Movie Folder/Surf Assassins/Surf Assassins_part4.mov",
                       @"http://surfvidz.com/Main Movie Folder/Surf Assassins/Surf Assassins_part5.mov",
                       @"http://surfvidz.com/Main Movie Folder/Surf Assassins/Surf Assassins_part6.mov",
                       @"http://surfvidz.com/Main Movie Folder/Surf Assassins/Surf Assassins_part7.mov",
                       nil];

    MoviesArray=[[NSMutableArray alloc]init];
    [MoviesArray addObject:movie1];
    [MoviesArray addObject:movie2];
    [MoviesArray addObject:movie3];
    [MoviesArray addObject:movie4];
    [MoviesArray addObject:movie5];
    [MoviesArray addObject:movie6];
//    [MoviesArray addObject:movie7];
    [MoviesArray addObject:movie8];
    [MoviesArray addObject:movie9];
    [MoviesArray addObject:movie10];
    [MoviesArray addObject:movie11];
    [MoviesArray addObject:movie12];
    [MoviesArray addObject:movie13];
    [MoviesArray addObject:movie14];
    [MoviesArray addObject:movie15];
    [MoviesArray addObject:movie16];
    [MoviesArray addObject:movie17];
    [MoviesArray addObject:movie18];
    [MoviesArray addObject:movie19];
    [MoviesArray addObject:movie20];
    [MoviesArray addObject:movie21];
    [MoviesArray addObject:movie22];
    [MoviesArray addObject:movie23];
    
    
    UITableView   *ButtonTableView=[[UITableView alloc]init];
    ButtonTableView.backgroundColor=[UIColor clearColor];
    ButtonTableView.scrollEnabled=YES;
    ButtonTableView.delegate=self;
    ButtonTableView.dataSource=self;
//    ButtonTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:ButtonTableView];

    
    NSString *platfromMobile =[self platform];
    NSString *stringTwo =@"iPhone4,1";
    
    NSComparisonResult result = [platfromMobile compare:stringTwo];
    
    if (result == NSOrderedDescending) // stringOne > stringTwo
        
    {
        NSLog(@"simulator and Iphone5");
        
        ButtonTableView.frame=CGRectMake(0, 0, 320, 410);
        
    }
    else
    {
        ButtonTableView.frame=CGRectMake(0, 0, 320, 410);
    }
    // Do any additional setup after loading the view from its nib.
}
#pragma mark tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (CGFloat) tableView: (UITableView *) tableView heightForRowAtIndexPath: (NSIndexPath *) indexPath
{
    
    return 80.0;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return [imagesArray count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

/*
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        
           cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease]; 
       
        
    }
    
    cell.textLabel.text=[moviesListArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor=[UIColor blackColor];
    cell.textLabel.font=[UIFont fontWithName:@"Georgia-Bold" size:14.0];
   // cell.imageView.image=[UIImage imageNamed:[imagesArray objectAtIndex:indexPath.row]];
   // cell.imageView.frame=CGRectMake(2, 2, 50, 50);
    
    return cell;
*/
    
    static NSString *CellIdentifier = @"PinInfoCellIdentifier";
    
    PinInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        UIViewController    *viewController = [[UIViewController alloc] initWithNibName:@"PinInfoCell" bundle:nil];
        cell =(PinInfoCell*) viewController.view;
    }
    

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
//    NSString * strImageName = [imagesArray objectAtIndex:indexPath.row];
//    [cell.pinImg setImage:[UIImage imageNamed:strImageName]];
    
    NSString * strTitle = [moviesListArray objectAtIndex:indexPath.row];
    cell.pinTitle.text = strTitle;
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    VideoPreviewViewController *nextView = [[VideoPreviewViewController alloc]init];
    nextView.Videolinkname=[moviesListArray objectAtIndex:indexPath.row];
    nextView.imageString=[imagesArray objectAtIndex:indexPath.row];
    nextView.MovieText=[MoviesInfoArray objectAtIndex:indexPath.row];
    NSLog(@"%@--", nextView.MovieText);
    nextView.productIndex = [NSString stringWithFormat:@"%d",indexPath.row];
    [self.navigationController pushViewController:nextView animated:YES];
    
    
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    app.tableArray=[MoviesArray objectAtIndex:indexPath.row];
    [nextView release];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *) platform
{
    
    size_t size;
    
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    
    char *machine = malloc(size);
    
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine];
    
    free(machine);
    
    return platform;
}


@end
