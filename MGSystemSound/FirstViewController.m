//
//  FirstViewController.m
//  MGSystemSound
//
//  Created by Gabriele Merlonghi on 18/08/13.
//  Copyright (c) 2013 Gabriele Merlonghi. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Sound Table", @"Sound Table");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //ricava il percorso del file nella cartella Documents
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"SystemSounds" ofType:@"plist"];
	
    //verifico l'esistenza e carico il file in memoria
	if ([fileManager fileExistsAtPath:dataFilePath]) {
		NSLog(@"il file esiste");
	} else {
		NSLog(@"il file NON esiste");
	}
    
    _soundList = [[NSDictionary alloc] initWithContentsOfFile:dataFilePath];
    _soundIDList = [[NSMutableArray alloc] init];
    
    NSLog(@"file plist:%@", _soundList);
    
    NSEnumerator *enumerator = [_soundList keyEnumerator];
    id key;
    
    while ((key = [enumerator nextObject])) {
        [_soundIDList addObject:[[_soundList objectForKey:key] objectForKey:@"SoundID"]];
    }
    NSLog(@"_soundIDList %@", _soundIDList);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Table view methods

//setta il numero di sezioni della tabella
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//setta il numero di righe della tabella
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	//il numero di righe deve corrispondere al numero di elementi della lista
	return [_soundList count];
}

// Setta il contenuto delle varie celle della tabella
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSString *fieldvalue;	//contenitore di estrazione di un singolo field di un elemento plist
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
	if (cell == nil){
		//setta lo stile con cui vengono selezionate le righe
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
	}
    
    NSInteger firstKey = [[_soundIDList objectAtIndex:indexPath.row] integerValue];
    
	//inserimento del titolo della cella e sua formattazione
    cell.textLabel.text = [@"" stringByAppendingFormat:@"%d", firstKey];
    
    
	//exstract tha subtitle label
	fieldvalue = [[_soundList objectForKey:[@"" stringByAppendingFormat:@"%d", firstKey]] objectForKey:@"Description"];
    //insert the subtitle
    cell.detailTextLabel.text = fieldvalue;
    cell.detailTextLabel.textColor = [UIColor darkGrayColor];
	cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    
	//Configure the cell
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
	return cell;
}

// Azione associata al tap di un elemento della lista
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SystemSoundID SoundID = [[_soundIDList objectAtIndex:indexPath.row] integerValue];
    
    AudioServicesPlaySystemSound(SoundID);
    
}


@end
