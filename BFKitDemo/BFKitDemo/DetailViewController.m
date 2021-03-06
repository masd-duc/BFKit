//
//  DetailViewController.m
//  BFKitDemo
//
//  Created by Fabrizio on 08/09/14.
//  Copyright (c) 2014 Fabrizio Brancati. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
{
    UIScrollView *_scrollView;
}
@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _scrollView = [UIScrollView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) contentSize:CGSizeZero clipsToBounds:NO pagingEnabled:NO showScrollIndicators:YES delegate:nil];
        [self.view addSubview:_scrollView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForDetail:(DetailType)detailType
{
    switch(detailType)
    {
        case DetailTypeUIButton:
        {
            self.title = @"UIButton";
            [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)];
            
            UIButton *clearButton = [UIButton initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 44) title:@"Button with clear color"];
            [clearButton setTitleColor:[UIColor colorWithRed:0.212 green:0.663 blue:0.878 alpha:1.000] highlightedColor:[UIColor colorWithRed:0.166 green:0.528 blue:0.700 alpha:1.000]];
            [_scrollView addSubview:clearButton];
            
            UIButton *borderedButton = [UIButton initWithFrame:CGRectMake(20, 80, SCREEN_WIDTH - 40, 44) title:@"Button with border"];
            [borderedButton setTitleColor:[UIColor colorWithRed:0.301 green:0.550 blue:0.686 alpha:1.000] highlightedColor:[UIColor colorWithRed:0.250 green:0.457 blue:0.572 alpha:1.000]];
            [borderedButton createBordersWithColor:[UIColor colorWithRed:0.301 green:0.550 blue:0.686 alpha:1.000] withCornerRadius:10 andWidth:3];
            [_scrollView addSubview:borderedButton];
            
            UIButton *coloredButton = [UIButton initWithFrame:CGRectMake(20, 140, SCREEN_WIDTH - 40, 44) title:@"Button with color" color:[UIColor colorWithRed:0.301 green:0.550 blue:0.686 alpha:1.000] highlightedColor:[UIColor colorWithRed:0.250 green:0.457 blue:0.572 alpha:1.000]];
            [coloredButton setTitleColor:[UIColor whiteColor] highlightedColor:[UIColor whiteColor]];
            [_scrollView addSubview:coloredButton];
            
            UIButton *coloredCornerRadiusButton = [UIButton initWithFrame:CGRectMake(20, 200, SCREEN_WIDTH - 40, 44) title:@"Button with corner radius" color:[UIColor colorWithRed:0.301 green:0.550 blue:0.686 alpha:1.000] highlightedColor:[UIColor colorWithRed:0.250 green:0.457 blue:0.572 alpha:1.000]];
            [coloredCornerRadiusButton setTitleColor:[UIColor whiteColor]];
            [coloredCornerRadiusButton setCornerRadius:10];
            [_scrollView addSubview:coloredCornerRadiusButton];
            
            UIButton *otherFontButton = [UIButton initWithFrame:CGRectMake(20, 260, SCREEN_WIDTH - 40, 44) title:@"Button with other font"];
            [otherFontButton setTitleFont:FontNameChalkduster size:17];
            [otherFontButton setTitleColor:[UIColor colorWithRed:0.212 green:0.663 blue:0.878 alpha:1.000]];
            [_scrollView addSubview:otherFontButton];
            
            break;
        }
        case DetailTypeUIColor:
        {
            self.title = @"UIColor";
            [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)];
            
            UIView *hexStringColor = [[UIView alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 44)];
            [hexStringColor setBackgroundColor:[UIColor colorWithHexString:@"#36a9e0"]];
            UILabel *hexStringColorLabel = [UILabel initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 40, 44) text:@"HEX String Color" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [hexStringColor addSubview:hexStringColorLabel];
            [_scrollView addSubview:hexStringColor];
            
            UIView *hexColor = [[UIView alloc] initWithFrame:CGRectMake(20, 80, SCREEN_WIDTH - 40, 44)];
            [hexColor setBackgroundColor:[UIColor colorWithHex:0xE23400]];
            UILabel *hexColorLabel = [UILabel initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 40, 44) text:@"HEX Color" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [hexColor addSubview:hexColorLabel];
            [_scrollView addSubview:hexColor];
            
            UIView *randomColor = [[UIView alloc] initWithFrame:CGRectMake(20, 140, SCREEN_WIDTH - 40, 44)];
            [randomColor setBackgroundColor:[UIColor randomColor]];
            UILabel *randomColorLabel = [UILabel initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 40, 44) text:@"Random Color" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [randomColor addSubview:randomColorLabel];
            [_scrollView addSubview:randomColor];
            
            break;
        }
        case DetailTypeUIDevice:
        {
            self.title = @"UIDevice";
            [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)];
            
            NSMutableString *deviceInfoString = [[NSMutableString alloc] init];
            
            if([UIDevice isiPhone])
                [deviceInfoString appendString:@"Device: iPhone\n"];
            else if([UIDevice isiPad])
                [deviceInfoString appendString:@"Device: iPad\n"];
            else if([UIDevice isiPod])
                [deviceInfoString appendString:@"Device: iPod\n"];
            else if([UIDevice isSimulator])
                [deviceInfoString appendString:@"Device: Simulator\n"];
            
            if([UIDevice isRetina])
                [deviceInfoString appendString:@"Retina: Yes\n"];
            else
                [deviceInfoString appendString:@"Retina: No\n"];
            
            if([UIDevice isRetinaHD])
                [deviceInfoString appendString:@"Retina HD: Yes\n"];
            else
                [deviceInfoString appendString:@"Retina HD: No\n"];
            
            [deviceInfoString appendString:[NSString stringWithFormat:@"iOS Version: %li\n", (long)[UIDevice iOSVersion]]];
            
            [deviceInfoString appendString:[NSString stringWithFormat:@"RAM Size: %lu MB\n", (long)[UIDevice ramSize] / 1024 / 1024]];
            
            [deviceInfoString appendString:[NSString stringWithFormat:@"Unique Identifier: %@\n", [UIDevice uniqueIdentifier]]];
            
            UILabel *deviceInfoLabel = [UILabel initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 200) text:deviceInfoString font:FontNameHelveticaLight size:16 color:[UIColor blackColor] alignment:NSTextAlignmentLeft lines:8];
            [_scrollView addSubview:deviceInfoLabel];
            
            break;
        }
        case DetailTypeUIFont:
        {
            self.title = @"UIFont";
            [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)];
            
            [UIFont allFamilyAndFonts];
            
            UILabel *fontLabel = [UILabel initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 25) text:@"Use a font with just an ENUM ^_^" font:FontNameNoteworthyLight size:16 color:[UIColor blackColor] alignment:NSTextAlignmentLeft lines:1];
            [_scrollView addSubview:fontLabel];
            
            UILabel *otherFontLabel = [UILabel initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 25) text:@"It's awesome!" font:FontNameSuperclarendonBold size:16 color:[UIColor randomColor] alignment:NSTextAlignmentLeft lines:1];
            [_scrollView addSubview:otherFontLabel];
            
            break;
        }
        case DetailTypeUIImage:
        {
            self.title = @"UIImage";
            [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, ((SCREEN_WIDTH - 40) * 10) + (20 * 11))];
            
            UIImage *blendOverlayImage = [[UIImage imageNamed:@"Logo"] blendOverlay];
            UIImageView *blendOverlayImageView = [UIImageView initWithImage:blendOverlayImage frame:CGRectMake(20, 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
            UILabel *blendOverlayLabel = [UILabel initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH - 40, 25) text:@"Blend Overlay" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [blendOverlayImageView addSubview:blendOverlayLabel];
            [_scrollView addSubview:blendOverlayImageView];
            
            UIImage *maskedImage = [[UIImage imageNamed:@"Logo"] maskWithImage:[UIImage imageNamed:@"Logo2"]];
            UIImageView *maskedImageView = [UIImageView initWithImage:maskedImage frame:CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
            UILabel *maskedImageLabel = [UILabel initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH - 40, 25) text:@"Masked Image" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [maskedImageView addSubview:maskedImageLabel];
            [_scrollView addSubview:maskedImageView];
            
            UIImage *imageAtRectImage = [[UIImage imageNamed:@"Logo"] imageAtRect:CGRectMake(0, 0, 250, 250)];
            UIImageView *imageAtRectImageView = [UIImageView initWithImage:imageAtRectImage frame:CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + maskedImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
            UILabel *imageAtRectLabel = [UILabel initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH - 40, 25) text:@"Image At Rect" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [imageAtRectImageView addSubview:imageAtRectLabel];
            [_scrollView addSubview:imageAtRectImageView];
            
            UIImage *rotatedImage = [[UIImage imageNamed:@"Logo"] imageRotatedByDegrees:90];
            UIImageView *rotatedImageView = [UIImageView initWithImage:rotatedImage frame:CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + maskedImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
            UILabel *rotatedLabel = [UILabel initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH - 40, 25) text:@"Rotated Image" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [rotatedImageView addSubview:rotatedLabel];
            [_scrollView addSubview:rotatedImageView];
            
            UIImage *filledImage = [[UIImage imageNamed:@"Logo2"] fillAlphaWithColor:[UIColor colorWithRed:0.212 green:0.663 blue:0.878 alpha:1.000]];
            UIImageView *filledImageView = [UIImageView initWithImage:filledImage frame:CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + maskedImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
            UILabel *filledLabel = [UILabel initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH - 40, 25) text:@"Filled Image" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [filledImageView addSubview:filledLabel];
            [_scrollView addSubview:filledImageView];
            
            UIImage *invertedImage = [[UIImage imageNamed:@"Logo"] invertColors];
            UIImageView *invertedImageView = [UIImageView initWithImage:invertedImage frame:CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + maskedImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
            UILabel *invertedLabel = [UILabel initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH - 40, 25) text:@"Inverted Image" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [invertedImageView addSubview:invertedLabel];
            [_scrollView addSubview:invertedImageView];
            
            UIImage *blurredImage = [[UIImage imageNamed:@"Logo"] boxBlurImageWithBlur:20];
            UIImageView *blurredImageView = [UIImageView initWithImage:blurredImage frame:CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + maskedImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
            UILabel *blurredLabel = [UILabel initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH - 40, 25) text:@"Blurred Image" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [blurredImageView addSubview:blurredLabel];
            [_scrollView addSubview:blurredImageView];
            
            UIImage *bumpedImage = [[UIImage imageNamed:@"Logo"] bumpDistortionLinear:[CIVector vectorWithX:SCREEN_WIDTH - 40 Y:SCREEN_WIDTH - 40] radius:100 angle:M_PI scale:2];
            UIImageView *bumpedImageView = [UIImageView initWithImage:bumpedImage frame:CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + maskedImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20 + blurredImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
            UILabel *bumpedLabel = [UILabel initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH - 40, 25) text:@"Bump Distortion Linear Image" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [bumpedImageView addSubview:bumpedLabel];
            [_scrollView addSubview:bumpedImageView];
            
            UIImage *sepiaImage = [[UIImage imageNamed:@"Logo"] sepiaToneWithIntensity:1];
            UIImageView *sepiaImageView = [UIImageView initWithImage:sepiaImage frame:CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + maskedImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20 + blurredImageView.frame.size.height + 20 + bumpedImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
            UILabel *sepiaLabel = [UILabel initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH - 40, 25) text:@"Sepia Tone Image" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [sepiaImageView addSubview:sepiaLabel];
            [_scrollView addSubview:sepiaImageView];
            
            UIImage *colorImage = [UIImage imageWithColor:[UIColor colorWithRed:0.357 green:0.620 blue:0.746 alpha:1.000]];
            UIImageView *colorImageView = [UIImageView initWithImage:colorImage frame:CGRectMake(20, 20 + blendOverlayImageView.frame.size.height + 20 + maskedImageView.frame.size.height + 20 + imageAtRectImageView.frame.size.height + 20 + rotatedImageView.frame.size.height + 20 + filledImageView.frame.size.height + 20 + invertedImageView.frame.size.height + 20 + blurredImageView.frame.size.height + 20 + bumpedImageView.frame.size.height + 20 + sepiaImageView.frame.size.height + 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
            UILabel *colorLabel = [UILabel initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH - 40, 25) text:@"Color Image" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [colorImageView addSubview:colorLabel];
            [_scrollView addSubview:colorImageView];
            
            break;
        }
        case DetailTypeUIImageView:
        {
            self.title = @"UIImageView";
            [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)];
            
            UIImageView *imageView = [UIImageView initWithImage:[UIImage imageNamed:@"Logo"] frame:CGRectMake(20, 20, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
            [_scrollView addSubview:imageView];
            
            break;
        }
        case DetailTypeUILabel:
        {
            self.title = @"UILabel";
            [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)];
            
            UILabel *normalLabel = [UILabel initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 25) text:@"Normal Label" font:FontNameHelveticaNeue size:16 color:[UIColor blackColor] alignment:NSTextAlignmentCenter lines:1];
            [_scrollView addSubview:normalLabel];
            
            UILabel *shadowLabel = [UILabel initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 25) text:@"Label with Shadow and other font" font:FontNameHoeflerTextBlack size:12 color:[UIColor colorWithRed:0.166 green:0.528 blue:0.700 alpha:1.000] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [_scrollView addSubview:shadowLabel];
            
            break;
        }
        case DetailTypeUIScrollView:
        {
            self.title = @"UIScrollView";
            [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, 1000)];
            
            UILabel *scrollLabel = [UILabel initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH - 40, 25) text:@"You are just using an UIScrollView!" font:FontNameHelveticaNeue size:16 color:[UIColor blackColor] alignment:NSTextAlignmentCenter lines:1];
            [_scrollView addSubview:scrollLabel];
            
            break;
        }
        case DetailTypeUITableView:
        {
            self.title = @"UITableView";
            [_scrollView removeFromSuperview];
            
            UITableView *tableView = [UITableView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain cellSeparatorStyle:UITableViewCellSeparatorStyleSingleLine separatorInset:UIEdgeInsetsMake(0, 15, 0, 0) dataSource:nil delegate:nil];
            [self.view addSubview:tableView];
            
            break;
        }
        case DetailTypeUITextField:
        {
            self.title = @"UITextField";
            [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)];
            
            UITextField *textField = [UITextField initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 25) placeholder:@"Text field placeholder" color:[UIColor colorWithRed:0.166 green:0.528 blue:0.700 alpha:1.000] font:FontNameVerdana size:18 returnType:UIReturnKeyDone keyboardType:UIKeyboardTypeEmailAddress secure:NO borderStyle:UITextBorderStyleBezel autoCapitalization:UITextAutocapitalizationTypeWords keyboardAppearance:UIKeyboardAppearanceLight enablesReturnKeyAutomatically:YES clearButtonMode:UITextFieldViewModeWhileEditing autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [_scrollView addSubview:textField];
            
            break;
        }
        case DetailTypeUITextView:
        {
            self.title = @"UITextView";
            [_scrollView removeFromSuperview];
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:@"This is a text view\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse lacinia blandit eros, sit amet aliquet tellus sollicitudin et. Nullam a ipsum nec libero hendrerit aliquet. Pellentesque faucibus pretium odio, sit amet accumsan arcu malesuada ut. Cras rhoncus volutpat nisl consequat eleifend. Donec tincidunt consectetur justo, molestie hendrerit justo dictum vel. Vestibulum nec commodo arcu. Donec sodales, augue vel fermentum ultrices, nunc augue vulputate tortor, sit amet eleifend nisl sapien eget magna. Donec aliquet mattis mi vel fermentum. Donec elementum pellentesque libero, in aliquam mauris luctus vel. In et vulputate nibh, id tristique ipsum. Donec fermentum ante et augue cursus aliquam. Vivamus nisi justo, pulvinar porta dolor id, tristique pretium augue. Nulla blandit felis felis, ut rutrum eros rutrum eu. Morbi mauris dolor, feugiat non placerat non, ultrices nec eros. Sed at eleifend felis. Mauris blandit feugiat nulla eget tempor. Nunc semper suscipit magna et semper. Suspendisse a arcu vitae diam scelerisque vestibulum ut eu dolor. Suspendisse accumsan venenatis leo, id maximus turpis. Pellentesque ac nunc augue. Etiam pharetra velit quis metus ornare vehicula. Cras eleifend sapien vitae est ultrices, a ullamcorper nibh scelerisque. Pellentesque tempor tortor dignissim, cursus tortor ac, sagittis felis. Praesent ultrices scelerisque odio, in fringilla sem tincidunt quis. Aenean sem augue, mattis luctus magna vel, accumsan volutpat felis. Nam blandit venenatis tincidunt. Pellentesque sodales lectus at orci tempus, vel pharetra massa vestibulum. Integer scelerisque ex aliquet quam molestie, a laoreet augue mattis. Etiam ut ex nisi. Mauris mollis tincidunt hendrerit. Nunc mi lectus, viverra ut nunc et, sagittis maximus augue. Pellentesque ullamcorper condimentum enim, vitae tempus risus. Maecenas facilisis lectus eget sem luctus porta. Etiam ut nunc non diam facilisis volutpat. Phasellus a augue feugiat, iaculis metus sit amet, pharetra lacus. Nulla facilisi. Maecenas sollicitudin justo ac auctor feugiat. Nunc ac dui sem. Aliquam fringilla porttitor massa, quis mattis nisl sodales a. Pellentesque iaculis non nisi aliquam malesuada. Aliquam erat volutpat. Donec arcu dui, rutrum ut tortor id, hendrerit aliquam ligula." color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeUIView:
        {
            self.title = @"UIView";
            [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)];
            
            UIView *borderedView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 44)];
            [borderedView setBackgroundColor:[UIColor colorWithRed:0.729 green:0.306 blue:0.122 alpha:1.000]];
            [borderedView createBordersWithColor:[UIColor colorWithRed:0.886 green:0.204 blue:0.000 alpha:1.000] withCornerRadius:10 andWidth:3];
            UILabel *borderedLabel = [UILabel initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 40, 44) text:@"Border View" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [borderedView addSubview:borderedLabel];
            [_scrollView addSubview:borderedView];
            
            UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH - 40, 44)];
            [shadowView setBackgroundColor:[UIColor colorWithRed:0.357 green:0.618 blue:0.746 alpha:1.000]];
            [shadowView createRectShadowWithOffset:CGSizeMake(10, 10) opacity:0.5 radius:10];
            UILabel *shadowLabel = [UILabel initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 40, 44) text:@"Shadow View" font:FontNameHelveticaNeue size:16 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter lines:1 shadowColor:[UIColor blackColor]];
            [shadowView addSubview:shadowLabel];
            [_scrollView addSubview:shadowView];
            
            UIButton *coloredButton = [UIButton initWithFrame:CGRectMake(20, 180, SCREEN_WIDTH - 40, 44) title:@"Touch me!" color:[UIColor colorWithRed:0.301 green:0.550 blue:0.686 alpha:1.000] highlightedColor:[UIColor colorWithRed:0.250 green:0.457 blue:0.572 alpha:1.000]];
            [coloredButton setTitleColor:[UIColor whiteColor] highlightedColor:[UIColor whiteColor]];
            [coloredButton addTarget:self action:@selector(shakeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:coloredButton];
            
            break;
        }
        case DetailTypeUIWebView:
        {
            self.title = @"UIWebView";
            [_scrollView removeFromSuperview];
            
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
            [webView loadWebsite:@"http://www.google.com"];
            [webView removeShadow];
            [self.view addSubview:webView];
            
            break;
        }
        case DetailTypeNSArray:
        {
            self.title = @"NSArray";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            NSArray *array = @[@"1", @"2", @"3", @"4", @"5"];
            
            BFLog(@"Normal Array: %@", array);
            BFLog(@"Reversed Array: %@", [array reversedArray]);
            BFLog(@"Array to JSON: %@", [array arrayToJson]);
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeNSDate:
        {
            self.title = @"NSDate";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            NSDate *today = [NSDate date];
            
            BFLog(@"Today: %@", today);
            BFLog(@"Yesterday: %@", [NSDate yesterday]);
            BFLog(@"Today is: %@", [today dayFromWeekday]);
            BFLog(@"Description of today: %@", [NSDate dateInformationDescriptionWithInformation:[today dateInformation]]);
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeNSDictionary:
        {
        	self.title = @"NSDictionary";
            [_scrollView removeFromSuperview];
            
            BFLogClear;

        	NSDate *today = [NSDate date];

        	NSDictionary *dic = @{@"Today": [today description], @"Description of today" :[NSDate dateInformationDescriptionWithInformation:[today dateInformation]], @"array": @[@1, @2, @3]};
        	BFLog(@"Normal Dictionary: %@", dic);
        	BFLog(@"Dictionary to JSON: %@", [dic dictionaryToJson]);
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
        	break;
    	}
        case DetailTypeNSFileManager:
        {
            self.title = @"NSFileManager";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            NSArray *array = @[@"1", @"2", @"3", @"4", @"5"];
            
            BFLog([NSFileManager saveArrayToPath:DirectoryTypeDocuments withFilename:@"temp" array:array] ? @"Save array: Yes" : @"Save array: No");
            BFLog(@"Directory: %@", [NSFileManager getDocumentsDirectoryForFile:@"temp.plist"]);
            BFLog([NSFileManager deleteFile:@"temp.plist" fromDirectory:DirectoryTypeDocuments] ? @"Delete file: Yes" : @"Delete file: No");
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeNSMutableArray:
        {
            self.title = @"NSMutableArray";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@"1", @"2", @"3", @"4", @"5"]];
            
            [array moveObjectFromIndex:0 toIndex:2];
            BFLog(@"Move objects: %@", array);
            BFLog(@"Reversed Array: %@", [array reversedArray]);
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeNSMutableDictionary:
        {
            self.title = @"NSMutableDictionary";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
            
            [dictionary safeSetObject:[UIImage new] forKey:@"Image"];
            BFLog(@"Dictionary: %@", dictionary);
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeNSNumber:
        {
            self.title = @"NSNumber";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            BFLog(@"Radians to degrees: %f", RadiansToDegrees(M_PI));
            BFLog(@"Random int: %li", (long)[NSNumber randomIntBetweenMin:10 andMax:50]);
            BFLog(@"Random float: %f", [NSNumber randomFloatBetweenMin:0.1 andMax:0.9]);
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeNSObject:
        {
            self.title = @"NSObject";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            NSObject *nilObject = nil;
            NSObject *object = @"Object";
            
            BFLog([nilObject isValid] ? @"Object is valid" : @"Object is not valid");
            BFLog([object isValid] ? @"Object is valid" : @"Object is not valid");
            
            [self performSelector:@selector(multiArgumentsSelectorWithString:string:string:string:) withObjects:@"String 1", @"String 2", @"String 3", @"String 4", nil];
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeNSProcessInfo:
        {
            self.title = @"NSProcessInfo";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            BFLog(@"CPU usage: %f", [NSProcessInfo cpuUsage]);
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeNSString:
        {
            self.title = @"NSString";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            NSString *search = @"Search in this string!";
            BFLog(@"Search: %@", [search searchCharStart:'a' charEnd:'s']);
            BFLog(@"MD5: %@", [search MD5]);
            BFLog(@"SHA1: %@", [search SHA1]);
            BFLog(@"SHA256: %@", [search SHA256]);
            BFLog(@"SHA512: %@", [search SHA512]);
            BFLog([search isEmail] ? @"Is email: Yes" : @"Is email: No");
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeNSThread:
        {
            self.title = @"NSThread";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            [self performSelectorInBackground:@selector(threadMethod) withObject:nil];
            
            break;
        }
        case DetailTypeBFApp:
        {
            self.title = @"BFApp";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            BFLog(@"App name: %@", APP_NAME);
            BFLog(@"App build: %@", APP_BUILD);
            BFLog(@"App version: %@", APP_VERSION);
            BFLog(@"Localized string from BFKit: %@", BFLocalizedString(@"OPEN", @""));
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeBFLog:
        {
            self.title = @"BFLog";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            BFLog(@"This will be shown only if in DEBUG mode");
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeBFSystemSound:
        {
            self.title = @"BFSystemSound";
            [_scrollView removeFromSuperview];
            
            BFLogClear;
            
            [BFSystemSound playSystemSoundVibrate];
            BFLog(@"Vibrate");
            [BFSystemSound playSystemSound:AudioIDRecivedMessage];
            BFLog(@"Play sound");
            
            UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
            [self.view addSubview:textView];
            
            break;
        }
        case DetailTypeBFTouchID:
        {
            self.title = @"BFTouchID";
            [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 120)];
            
            UILabel *normalLabel = [UILabel initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 50) text:@"Waiting for Touch ID..." font:FontNameHelveticaNeue size:16 color:[UIColor blackColor] alignment:NSTextAlignmentCenter lines:2];
            [_scrollView addSubview:normalLabel];
            
            [BFTouchID showTouchIDAuthenticationWithReason:BFLocalizedString(@"AUTHENTICATION", @"") completion:^(TouchIDResult result) {
                switch(result)
                {
                    case TouchIDResultSuccess:
                    {
                        runOnMainThread(^{
                            [normalLabel setText:BFLocalizedString(@"AUTHORIZED", @"")];
                        });
                        break;
                    }
                    case TouchIDResultAuthenticationFailed:
                    {
                        runOnMainThread(^{
                            [normalLabel setText:BFLocalizedString(@"NOT_OWNER", @"")];
                        });
                        break;
                    }
                    default:
                    {
                        runOnMainThread(^{
                            [normalLabel setText:BFLocalizedString(@"ERROR", @"")];
                        });
                        break;
                    }
                }
            }];
            
            break;
        }
        default:
            break;
    }
}

- (IBAction)shakeButtonAction:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [button shakeView];
}

- (void)threadMethod
{
    BFLog(@"Background: %@", [NSThread currentThread]);
    
    runOnMainThread(^{
        BFLog(@"Main: %@", [NSThread currentThread]);
        
        UITextView *textView = [UITextView initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) text:BFLogString color:[UIColor blackColor] font:FontNameHelveticaNeue size:16 alignment:NSTextAlignmentLeft dataDetectorTypes:UIDataDetectorTypeAll editable:NO selectable:NO returnType:UIReturnKeyDefault keyboardType:UIKeyboardTypeDefault secure:NO autoCapitalization:UITextAutocapitalizationTypeNone keyboardAppearance:UIKeyboardAppearanceDefault enablesReturnKeyAutomatically:YES autoCorrectionType:UITextAutocorrectionTypeDefault delegate:nil];
        [self.view addSubview:textView];
    });
}

- (void)multiArgumentsSelectorWithString:(NSString *)string1 string:(NSString *)string2 string:(NSString *)string3 string:(NSString *)string4
{
    BFLog(@"\nString 1: %@\nString 2: %@\nString 3: %@\nString 4: %@", string1, string2, string3, string4);
}

@end
