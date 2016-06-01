
#import "ViewController.h"
#import "CropImageViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *originImageView;
@property (weak, nonatomic) IBOutlet UIButton *cropButton;
@property (strong, nonatomic) IBOutlet UIImageView *cropIMageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.cropIMageView.layer.cornerRadius = 210 / 2;
    
    self.cropIMageView.clipsToBounds = YES;
    
    self.cropIMageView.contentMode = UIViewContentModeScaleAspectFit;
    
}

- (IBAction)cropAction:(id)sender {
    CropImageViewController *cropImageViewController = [[CropImageViewController alloc] initWithOriginImage:self.originImageView.image callBack:^(UIImage *cropImage, CropImageViewController *viewController) {
        
          self.originImageView.hidden = YES;
        
         self.cropIMageView.hidden = NO;
//        self.originImageView.image = cropImage;
         self.cropIMageView.image = cropImage;
        
        [viewController dismissViewControllerAnimated:YES completion:nil];
    }];
    cropImageViewController.fixCropSize = YES;
    [self presentViewController:cropImageViewController animated:YES completion:^{
        
    }];
}

- (IBAction)resetAction:(id)sender {
    
    self.originImageView.hidden = NO;
    
    self.cropIMageView.hidden = YES;
    
    self.originImageView.image = [UIImage imageNamed:@"aa.jpg"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
